%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic RBC Model 
%(Approximation in logs)
% Generate Simulated data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

%clear all;
close all;
%clear all;


%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var ly lc lk li lh ly_l lw Rk z;
varexo e;

parameters beta chi delta alpha rho;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
% 
% U(c,n) = log(c) + chi*log(1-n)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[param,ss] = calibration;

alpha = param(1);
beta = param(2);
delta = param(3);
chi = param(4);
 
rho     = 0.95;  
sigma   = 0.01;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model; 
  
  //Consumption Euler equation
  (1/exp(lc)) = beta*(1/exp(lc(+1)))*(1+alpha*(exp(lk)^(alpha-1))*exp(z(+1))*exp(lh(+1))^(1-alpha)-delta);

// Labor supply
 chi*exp(lc)/(1-exp(lh)) = exp(lw);

// Labor demand
 exp(lw) = exp(z)*(1-alpha)*exp(lk(-1))^alpha*exp(lh)^(-alpha);

//Resource constraint
  exp(lc)+exp(li) = exp(ly);

//Production function
  exp(ly) = exp(z)*(exp(lk(-1))^alpha)*(exp(lh))^(1-alpha);

//Capital accumulation equation
  exp(li) = exp(lk)-(1-delta)*exp(lk(-1));

//Labor productivity
  exp(ly_l) = exp(ly)/exp(lh);


//Capital rental rate
 exp(Rk) = alpha*exp(ly)/exp(lk(-1));


//TFP shock
  z = rho*z(-1)+e;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  lk = log(ss(1));
  lc = log(ss(2));
  lh = log(ss(3));  
  li = log(ss(4));
  ly = log(ss(5));
  lw=log(ss(6));
  Rk=log(ss(7));
  ly_l = ly-lh;
  z = 0; 
end;

shocks;
var e = sigma^2;
end;

steady;

check;

stoch_simul(periods=1000, order = 1);

%----------------------------------------------------------------
% 5. Save simulated data
%----------------------------------------------------------------

datatomfile('simuldataRBC',[]);
return;