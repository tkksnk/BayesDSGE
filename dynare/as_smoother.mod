var yy dp nomr gshk zshk rshk dy_obs pi_obs r_obs;
varexo errgshk errzshk errrshk;
parameters tau kappa psi1 psi2 rho_R rho_g rho_z rA piA gammaQ;
varobs dy_obs pi_obs r_obs;

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

dy_obs = 1*(yy - yy(-1) + zshk) + gammaQ;
pi_obs = 4*dp + piA;
r_obs  = 4*nomr + (piA+rA+4*gammaQ);

end;

steady;

check;

shocks;
var errgshk = sigma_g^2;
var errzshk = sigma_z^2;
var errrshk = sigma_R^2;
end;

stoch_simul(periods=1000,order=1,irf=10) yy dp nomr rshk;

calib_smoother(datafile = us, filtered_vars);

T = 80;

figure;
subplot(311);
plot(oo_.SmoothedShocks.errgshk,'k-');
hold on;
plot([1 T],[0 0],'r-');
xlim([1 T]);
subplot(312);
plot(oo_.SmoothedShocks.errzshk,'k-');
hold on;
plot([1 T],[0 0],'r-');
xlim([1 T]);
subplot(313);
plot(oo_.SmoothedShocks.errrshk,'k-');
hold on;
plot([1 T],[0 0],'r-');
xlim([1 T]);

figure;
subplot(231);
plot(oo_.FilteredVariables.yy,'b--');
hold on;
plot(oo_.SmoothedVariables.yy,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('yy');
legend("Filtered","Smoothed");
subplot(232);
plot(oo_.FilteredVariables.dp,'b--');
hold on;
plot(oo_.SmoothedVariables.dp,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('dp');
subplot(233);
plot(oo_.FilteredVariables.nomr,'b--');
hold on;
plot(oo_.SmoothedVariables.nomr,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('nomr');
subplot(234);
plot(oo_.FilteredVariables.gshk,'b--');
hold on;
plot(oo_.SmoothedVariables.gshk,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('gshk');
subplot(235);
plot(oo_.FilteredVariables.zshk,'b--');
hold on;
plot(oo_.SmoothedVariables.zshk,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('zshk');
subplot(236);
plot(oo_.FilteredVariables.rshk,'b--');
hold on;
plot(oo_.SmoothedVariables.rshk,'k-');
plot([1 T],[0 0],'r-');
xlim([1 T]);
title('rshk');