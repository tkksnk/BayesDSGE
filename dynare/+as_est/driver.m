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
M_.fname = 'as_est';
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
M_.endo_names = cell(10,1);
M_.endo_names_tex = cell(10,1);
M_.endo_names_long = cell(10,1);
M_.endo_names(1) = {'notr'};
M_.endo_names_tex(1) = {'notr'};
M_.endo_names_long(1) = {'notr'};
M_.endo_names(2) = {'yy'};
M_.endo_names_tex(2) = {'yy'};
M_.endo_names_long(2) = {'yy'};
M_.endo_names(3) = {'dp'};
M_.endo_names_tex(3) = {'dp'};
M_.endo_names_long(3) = {'dp'};
M_.endo_names(4) = {'nomr'};
M_.endo_names_tex(4) = {'nomr'};
M_.endo_names_long(4) = {'nomr'};
M_.endo_names(5) = {'gshk'};
M_.endo_names_tex(5) = {'gshk'};
M_.endo_names_long(5) = {'gshk'};
M_.endo_names(6) = {'zshk'};
M_.endo_names_tex(6) = {'zshk'};
M_.endo_names_long(6) = {'zshk'};
M_.endo_names(7) = {'rshk'};
M_.endo_names_tex(7) = {'rshk'};
M_.endo_names_long(7) = {'rshk'};
M_.endo_names(8) = {'dy_obs'};
M_.endo_names_tex(8) = {'dy\_obs'};
M_.endo_names_long(8) = {'dy_obs'};
M_.endo_names(9) = {'pi_obs'};
M_.endo_names_tex(9) = {'pi\_obs'};
M_.endo_names_long(9) = {'pi_obs'};
M_.endo_names(10) = {'r_obs'};
M_.endo_names_tex(10) = {'r\_obs'};
M_.endo_names_long(10) = {'r_obs'};
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
M_.endo_nbr = 10;
M_.param_nbr = 10;
M_.orig_endo_nbr = 10;
M_.aux_vars = [];
options_.varobs = cell(3, 1);
options_.varobs(1)  = {'dy_obs'};
options_.varobs(2)  = {'pi_obs'};
options_.varobs(3)  = {'r_obs'};
options_.varobs_id = [ 8 9 10  ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = zeros(3, 3);
M_.Correlation_matrix_ME = eye(3, 3);
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 10;
M_.eq_nbr = 10;
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
 1 5 0;
 2 6 15;
 0 7 16;
 0 8 0;
 3 9 0;
 4 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;]';
M_.nstatic = 5;
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
  3 , 'name' , 'notr' ;
  4 , 'name' , 'nomr' ;
  5 , 'name' , 'gshk' ;
  6 , 'name' , 'zshk' ;
  7 , 'name' , 'rshk' ;
  8 , 'name' , 'dy_obs' ;
  9 , 'name' , 'pi_obs' ;
  10 , 'name' , 'r_obs' ;
};
M_.mapping.notr.eqidx = [3 4 ];
M_.mapping.yy.eqidx = [1 2 3 8 ];
M_.mapping.dp.eqidx = [1 2 3 9 ];
M_.mapping.nomr.eqidx = [1 4 10 ];
M_.mapping.gshk.eqidx = [1 2 3 5 ];
M_.mapping.zshk.eqidx = [1 6 8 ];
M_.mapping.rshk.eqidx = [3 7 ];
M_.mapping.dy_obs.eqidx = [8 ];
M_.mapping.pi_obs.eqidx = [9 ];
M_.mapping.r_obs.eqidx = [10 ];
M_.mapping.errgshk.eqidx = [5 ];
M_.mapping.errzshk.eqidx = [6 ];
M_.mapping.errrshk.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 5 6 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(10, 1), 'log_deflator', cell(10, 1), 'growth_factor', cell(10, 1), 'log_growth_factor', cell(10, 1));
M_.NNZDerivatives = [34; 0; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.H(1, 1) = (0.115984699309211)^2;
M_.H(2, 2) = (0.294166489106767)^2;
M_.H(3, 3) = (0.447587401922287)^2;
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 1, NaN, (-Inf), Inf, 2, 2.0, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, NaN, (-Inf), Inf, 2, 1.50, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 2, 0.50, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, NaN, (-Inf), Inf, 5, NaN, NaN, 0.0, 1.0, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, NaN, (-Inf), Inf, 2, 0.5, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, NaN, (-Inf), Inf, 2, 7.0, 2.0, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, NaN, (-Inf), Inf, 3, 0.4, 0.2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, NaN, (-Inf), Inf, 4, 0.501325654926200, 0.262054551024813, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 1.253314137315500, 0.655136377562033, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, 0.626657068657750, 0.327568188781017, NaN, NaN, NaN ];
tmp1 = find(estim_params_.param_vals(:,1)==1);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{1}))
else
    estim_params_.param_vals(tmp1,2) = 2.09;
end
tmp1 = find(estim_params_.param_vals(:,1)==2);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{2}))
else
    estim_params_.param_vals(tmp1,2) = 0.98;
end
tmp1 = find(estim_params_.param_vals(:,1)==3);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{3}))
else
    estim_params_.param_vals(tmp1,2) = 2.25;
end
tmp1 = find(estim_params_.param_vals(:,1)==4);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{4}))
else
    estim_params_.param_vals(tmp1,2) = 0.65;
end
tmp1 = find(estim_params_.param_vals(:,1)==8);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{8}))
else
    estim_params_.param_vals(tmp1,2) = 0.34;
end
tmp1 = find(estim_params_.param_vals(:,1)==9);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{9}))
else
    estim_params_.param_vals(tmp1,2) = 3.16;
end
tmp1 = find(estim_params_.param_vals(:,1)==10);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{10}))
else
    estim_params_.param_vals(tmp1,2) = 0.51;
end
tmp1 = find(estim_params_.param_vals(:,1)==5);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{5}))
else
    estim_params_.param_vals(tmp1,2) = 0.81;
end
tmp1 = find(estim_params_.param_vals(:,1)==6);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{6}))
else
    estim_params_.param_vals(tmp1,2) = 0.98;
end
tmp1 = find(estim_params_.param_vals(:,1)==7);
if isempty(tmp1)
    disp(sprintf('Parameter %s is not estimated (the value provided in estimated_params_init is not used).', M_.param_names{7}))
else
    estim_params_.param_vals(tmp1,2) = 0.93;
end
tmp1 = find(estim_params_.var_exo(:,1)==3);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{3}))
else
    estim_params_.var_exo(tmp1,2) = 0.19;
end
tmp1 = find(estim_params_.var_exo(:,1)==1);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{1}))
else
    estim_params_.var_exo(tmp1,2) = 0.65;
end
tmp1 = find(estim_params_.var_exo(:,1)==2);
if isempty(tmp1)
    disp(sprintf('The standard deviation of %s is not estimated (the value provided in estimated_params_init is not used).', M_.exo_names{2}))
else
    estim_params_.var_exo(tmp1,2) = 0.24;
end
skipline()
options_.mh_drop = 0.25;
options_.mh_jscale = 0.6;
options_.mh_nblck = 1;
options_.mh_replic = 20000;
options_.mode_compute = 0;
options_.datafile = 'us';
options_.mode_file = 'as_est_mode';
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);
var_list_ = {'yy';'dp';'nomr'};
oo_ = shock_decomposition(M_,oo_,options_,var_list_,bayestopt_,estim_params_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'as_est_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
