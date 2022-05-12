var yy dp nomr gshk zshk rshk;
varexo errgshk errzshk errrshk;
parameters tau kappa psi1 psi2 rho_R rho_g rho_z rA piA gammaQ;

tau     = 2.26;
kappa   = 0.99;
psi1    = 1.93;
psi2    = 0.46;
rho_R   = 0.76;
rho_g   = 0.99;
rho_z   = 0.91;
rA      = 0.33;
piA     = 3.42;
gammaQ  = 0.62;
sigma_R = 0.21;
sigma_g = 0.63;
sigma_z = 0.19;

model;
#bet  = 1/(1+rA/400);

yy + (1/tau)*nomr - (1-rho_g)*gshk - rho_z/tau*zshk - yy(+1) - (1/tau)*dp(+1) = 0;

dp = kappa*(yy-gshk) + bet*dp(+1);

nomr = rho_R*nomr(-1) + (1-rho_R)*psi1*dp + (1-rho_R)*psi2*(yy-gshk) + rshk;

gshk = rho_g*gshk(-1) + errgshk;
zshk = rho_z*zshk(-1) + errzshk;
rshk = errrshk;

end;

steady;

check;

shocks;
var errrshk = sigma_R^2;
end;

stoch_simul(periods=1000,order=1,irf=10) yy dp nomr zshk;
