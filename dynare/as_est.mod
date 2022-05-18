var notr yy dp nomr gshk zshk rshk dy_obs pi_obs r_obs;
varexo errgshk errzshk errrshk;
varobs dy_obs pi_obs r_obs;
parameters tau kappa psi1 psi2 rho_R rho_g rho_z rA piA gammaQ;

model;
#bet  = 1/(1+rA/400);

yy + (1/tau)*nomr - (1-rho_g)*gshk - rho_z/tau*zshk - yy(+1) - (1/tau)*dp(+1) = 0;

dp = kappa*(yy-gshk) + bet*dp(+1);

notr = rho_R*notr(-1) + (1-rho_R)*psi1*dp + (1-rho_R)*psi2*(yy-gshk) + rshk;

nomr = notr;

gshk = rho_g*gshk(-1) + errgshk;
zshk = rho_z*zshk(-1) + errzshk;
rshk = errrshk;

dy_obs = 1*(yy - yy(-1) + zshk) + gammaQ;
pi_obs = 4*dp + piA;
r_obs  = 4*nomr + (piA+rA+4*gammaQ);

end;

// measurement errors
shocks;
var dy_obs;
stderr 0.115984699309211;
var pi_obs;
stderr 0.294166489106767;
var r_obs;
stderr 0.447587401922287;
end;

// From Table 2.2 in p. 19
estimated_params;
tau,   gamma_pdf, 2.0, 0.5;
kappa, uniform_pdf, , , 0.0, 1.0;
psi1,  gamma_pdf, 1.50, 0.25;
psi2,  gamma_pdf, 0.50, 0.25;
rho_R, uniform_pdf, , , 0.0, 1.0;
rho_g, uniform_pdf, , , 0.0, 1.0;
rho_z, uniform_pdf, , , 0.0, 1.0;
rA,    gamma_pdf, 0.5, 0.5;
piA,   gamma_pdf, 7.0, 2.0;
gammaQ, normal_pdf, 0.4, 0.2; 
stderr errrshk, inv_gamma_pdf, 0.501325654926200, 0.262054551024813;
stderr errgshk, inv_gamma_pdf, 1.253314137315500, 0.655136377562033;
stderr errzshk, inv_gamma_pdf, 0.626657068657750, 0.327568188781017;
end;

estimated_params_init;
// theta_m from Table 7.1 in p.145
tau     , 2.09;
kappa   , 0.98;
psi1    , 2.25;
psi2    , 0.65;
rA      , 0.34;
piA     , 3.16;
gammaQ  , 0.51;
rho_R   , 0.81;
rho_g   , 0.98;
rho_z   , 0.93;
stderr errrshk , 0.19;
stderr errgshk , 0.65;
stderr errzshk , 0.24;
end;

estimation(
datafile = us,
//mode_compute = 6,
mode_compute = 0,
mode_file = as_est_mode,
//mode_check,
mh_replic = 20000,
//mh_replic = 0,
//load_mh_file,
mh_drop = 0.25,
mh_jscale = 0.6,
mh_nblocks = 3
//irf = 40,
//bayesian_irf
);

shock_decomposition yy dp nomr;