%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'as_smoother';
M_.dynare_version = '5.1';
oo_.dynare_version = '5.1';
options_.dynare_version = '5.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'errgshk'};
M_.exo_names_tex(1) = {'errgshk'};
M_.exo_names_long(1) = {'errgshk'};
M_.exo_names(2) = {'errzshk'};
M_.exo_names_tex(2) = {'errzshk'};
M_.exo_names_long(2) = {'errzshk'};
M_.exo_names(3) = {'errrshk'};
M_.exo_names_tex(3) = {'errrshk'};
M_.exo_names_long(3) = {'errrshk'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'yy'};
M_.endo_names_tex(1) = {'yy'};
M_.endo_names_long(1) = {'yy'};
M_.endo_names(2) = {'dp'};
M_.endo_names_tex(2) = {'dp'};
M_.endo_names_long(2) = {'dp'};
M_.endo_names(3) = {'nomr'};
M_.endo_names_tex(3) = {'nomr'};
M_.endo_names_long(3) = {'nomr'};
M_.endo_names(4) = {'gshk'};
M_.endo_names_tex(4) = {'gshk'};
M_.endo_names_long(4) = {'gshk'};
M_.endo_names(5) = {'zshk'};
M_.endo_names_tex(5) = {'zshk'};
M_.endo_names_long(5) = {'zshk'};
M_.endo_names(6) = {'rshk'};
M_.endo_names_tex(6) = {'rshk'};
M_.endo_names_long(6) = {'rshk'};
M_.endo_names(7) = {'dy_obs'};
M_.endo_names_tex(7) = {'dy\_obs'};
M_.endo_names_long(7) = {'dy_obs'};
M_.endo_names(8) = {'pi_obs'};
M_.endo_names_tex(8) = {'pi\_obs'};
M_.endo_names_long(8) = {'pi_obs'};
M_.endo_names(9) = {'r_obs'};
M_.endo_names_tex(9) = {'r\_obs'};
M_.endo_names_long(9) = {'r_obs'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'tau'};
M_.param_names_tex(1) = {'tau'};
M_.param_names_long(1) = {'tau'};
M_.param_names(2) = {'kappa'};
M_.param_names_tex(2) = {'kappa'};
M_.param_names_long(2) = {'kappa'};
M_.param_names(3) = {'psi1'};
M_.param_names_tex(3) = {'psi1'};
M_.param_names_long(3) = {'psi1'};
M_.param_names(4) = {'psi2'};
M_.param_names_tex(4) = {'psi2'};
M_.param_names_long(4) = {'psi2'};
M_.param_names(5) = {'rho_R'};
M_.param_names_tex(5) = {'rho\_R'};
M_.param_names_long(5) = {'rho_R'};
M_.param_names(6) = {'rho_g'};
M_.param_names_tex(6) = {'rho\_g'};
M_.param_names_long(6) = {'rho_g'};
M_.param_names(7) = {'rho_z'};
M_.param_names_tex(7) = {'rho\_z'};
M_.param_names_long(7) = {'rho_z'};
M_.param_names(8) = {'rA'};
M_.param_names_tex(8) = {'rA'};
M_.param_names_long(8) = {'rA'};
M_.param_names(9) = {'piA'};
M_.param_names_tex(9) = {'piA'};
M_.param_names_long(9) = {'piA'};
M_.param_names(10) = {'gammaQ'};
M_.param_names_tex(10) = {'gammaQ'};
M_.param_names_long(10) = {'gammaQ'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 10;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
options_.varobs = cell(3, 1);
options_.varobs(1)  = {'dy_obs'};
options_.varobs(2)  = {'pi_obs'};
options_.varobs(3)  = {'r_obs'};
options_.varobs_id = [ 7 8 9  ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
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
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'dp' ;
  3 , 'name' , 'nomr' ;
  4 , 'name' , 'gshk' ;
  5 , 'name' , 'zshk' ;
  6 , 'name' , 'rshk' ;
  7 , 'name' , 'dy_obs' ;
  8 , 'name' , 'pi_obs' ;
  9 , 'name' , 'r_obs' ;
};
M_.mapping.yy.eqidx = [1 2 3 7 ];
M_.mapping.dp.eqidx = [1 2 3 8 ];
M_.mapping.nomr.eqidx = [1 3 9 ];
M_.mapping.gshk.eqidx = [1 2 3 4 ];
M_.mapping.zshk.eqidx = [1 5 7 ];
M_.mapping.rshk.eqidx = [3 6 ];
M_.mapping.dy_obs.eqidx = [7 ];
M_.mapping.pi_obs.eqidx = [8 ];
M_.mapping.r_obs.eqidx = [9 ];
M_.mapping.errgshk.eqidx = [4 ];
M_.mapping.errzshk.eqidx = [5 ];
M_.mapping.errrshk.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 3 4 5 ];
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
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [32; -1; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 2.26;
tau = M_.params(1);
M_.params(2) = 0.99;
kappa = M_.params(2);
M_.params(3) = 1.93;
psi1 = M_.params(3);
M_.params(4) = 0.46;
psi2 = M_.params(4);
M_.params(5) = 0.76;
rho_R = M_.params(5);
M_.params(6) = 0.99;
rho_g = M_.params(6);
M_.params(7) = 0.91;
rho_z = M_.params(7);
M_.params(8) = 0.33;
rA = M_.params(8);
M_.params(9) = 3.42;
piA = M_.params(9);
M_.params(10) = 0.62;
gammaQ = M_.params(10);
sigma_R = 0.21;
sigma_g = 0.63;
sigma_z = 0.19;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = sigma_g^2;
M_.Sigma_e(2, 2) = sigma_z^2;
M_.Sigma_e(3, 3) = sigma_R^2;
options_.irf = 10;
options_.order = 1;
options_.periods = 1000;
var_list_ = {'yy';'dp';'nomr';'rshk'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
options_.filtered_vars = true;
options_.datafile = 'us';
options_.parameter_set = 'calibration';
var_list_ = {};
options_.smoother = true;
options_.order = 1;
[oo_, M_, options_, bayestopt_] = evaluate_smoother(options_.parameter_set, var_list_, M_, oo_, options_, bayestopt_, estim_params_);
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


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_smoother_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
