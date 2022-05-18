%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
clear global
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'as_smoother';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'as_smoother.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'errgshk';
M_.exo_names_tex = 'errgshk';
M_.exo_names = char(M_.exo_names, 'errzshk');
M_.exo_names_tex = char(M_.exo_names_tex, 'errzshk');
M_.exo_names = char(M_.exo_names, 'errrshk');
M_.exo_names_tex = char(M_.exo_names_tex, 'errrshk');
M_.endo_names = 'yy';
M_.endo_names_tex = 'yy';
M_.endo_names = char(M_.endo_names, 'dp');
M_.endo_names_tex = char(M_.endo_names_tex, 'dp');
M_.endo_names = char(M_.endo_names, 'nomr');
M_.endo_names_tex = char(M_.endo_names_tex, 'nomr');
M_.endo_names = char(M_.endo_names, 'gshk');
M_.endo_names_tex = char(M_.endo_names_tex, 'gshk');
M_.endo_names = char(M_.endo_names, 'zshk');
M_.endo_names_tex = char(M_.endo_names_tex, 'zshk');
M_.endo_names = char(M_.endo_names, 'rshk');
M_.endo_names_tex = char(M_.endo_names_tex, 'rshk');
M_.endo_names = char(M_.endo_names, 'dy_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'dy\_obs');
M_.endo_names = char(M_.endo_names, 'pi_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi\_obs');
M_.endo_names = char(M_.endo_names, 'r_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_obs');
M_.param_names = 'tau';
M_.param_names_tex = 'tau';
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names = char(M_.param_names, 'psi1');
M_.param_names_tex = char(M_.param_names_tex, 'psi1');
M_.param_names = char(M_.param_names, 'psi2');
M_.param_names_tex = char(M_.param_names_tex, 'psi2');
M_.param_names = char(M_.param_names, 'rho_R');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_R');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names = char(M_.param_names, 'rA');
M_.param_names_tex = char(M_.param_names_tex, 'rA');
M_.param_names = char(M_.param_names, 'piA');
M_.param_names_tex = char(M_.param_names_tex, 'piA');
M_.param_names = char(M_.param_names, 'gammaQ');
M_.param_names_tex = char(M_.param_names_tex, 'gammaQ');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 10;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
options_.varobs = [];
options_.varobs = 'dy_obs';
options_.varobs = char(options_.varobs, 'pi_obs');
options_.varobs = char(options_.varobs, 'r_obs');
options_.varobs_id = [ 7 8 9  ];
M_.Sigma_e = zeros(3, 3);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('as_smoother_static');
erase_compiled_function('as_smoother_dynamic');
M_.lead_lag_incidence = [
 1 5 14;
 0 6 15;
 2 7 0;
 3 8 0;
 4 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;]';
M_.nstatic = 4;
M_.nfwrd   = 1;
M_.npred   = 3;
M_.nboth   = 1;
M_.equations_tags = {
};
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(10, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 32;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 2.26;
tau = M_.params( 1 );
M_.params( 2 ) = 0.99;
kappa = M_.params( 2 );
M_.params( 3 ) = 1.93;
psi1 = M_.params( 3 );
M_.params( 4 ) = 0.46;
psi2 = M_.params( 4 );
M_.params( 5 ) = 0.76;
rho_R = M_.params( 5 );
M_.params( 6 ) = 0.99;
rho_g = M_.params( 6 );
M_.params( 7 ) = 0.91;
rho_z = M_.params( 7 );
M_.params( 8 ) = 0.33;
rA = M_.params( 8 );
M_.params( 9 ) = 3.42;
piA = M_.params( 9 );
M_.params( 10 ) = 0.62;
gammaQ = M_.params( 10 );
sigma_R = 0.21;
sigma_g = 0.63;
sigma_z = 0.19;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = sigma_g^2;
M_.Sigma_e(2, 2) = sigma_z^2;
M_.Sigma_e(3, 3) = sigma_R^2;
M_.sigma_e_is_diagonal = 1;
options_.irf = 10;
options_.order = 1;
options_.periods = 1000;
var_list_=[];
var_list_ = 'yy';
var_list_ = char(var_list_, 'dp');
var_list_ = char(var_list_, 'nomr');
var_list_ = char(var_list_, 'rshk');
info = stoch_simul(var_list_);
options_.filtered_vars = 1;
options_.datafile = 'us';
var_list_=[];
options_.mode_compute = 0;
options_.smoother = 1;
options_.order = 1;
dynare_estimation(var_list_);
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
save('as_smoother_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
