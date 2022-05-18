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
M_.fname = 'rbcdata';
%
% Some global variables initialization
%
global_initialization;
diary off;
logname_ = 'rbcdata.log';
if exist(logname_, 'file')
    delete(logname_)
end
diary(logname_)
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.endo_names = 'ly';
M_.endo_names_tex = 'ly';
M_.endo_names = char(M_.endo_names, 'lc');
M_.endo_names_tex = char(M_.endo_names_tex, 'lc');
M_.endo_names = char(M_.endo_names, 'lk');
M_.endo_names_tex = char(M_.endo_names_tex, 'lk');
M_.endo_names = char(M_.endo_names, 'li');
M_.endo_names_tex = char(M_.endo_names_tex, 'li');
M_.endo_names = char(M_.endo_names, 'lh');
M_.endo_names_tex = char(M_.endo_names_tex, 'lh');
M_.endo_names = char(M_.endo_names, 'ly_l');
M_.endo_names_tex = char(M_.endo_names_tex, 'ly\_l');
M_.endo_names = char(M_.endo_names, 'lw');
M_.endo_names_tex = char(M_.endo_names_tex, 'lw');
M_.endo_names = char(M_.endo_names, 'Rk');
M_.endo_names_tex = char(M_.endo_names_tex, 'Rk');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.param_names = 'beta';
M_.param_names_tex = 'beta';
M_.param_names = char(M_.param_names, 'chi');
M_.param_names_tex = char(M_.param_names_tex, 'chi');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 5;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.H = 0;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('rbcdata_static');
erase_compiled_function('rbcdata_dynamic');
M_.lead_lag_incidence = [
 0 3 0;
 0 4 12;
 1 5 0;
 0 6 0;
 0 7 13;
 0 8 0;
 0 9 0;
 0 10 0;
 2 11 14;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 1;
M_.nboth   = 1;
M_.equations_tags = {
};
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 31;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
close all;
[param,ss] = calibration;
M_.params( 4 ) = param(1);
alpha = M_.params( 4 );
M_.params( 1 ) = param(2);
beta = M_.params( 1 );
M_.params( 3 ) = param(3);
delta = M_.params( 3 );
M_.params( 2 ) = param(4);
chi = M_.params( 2 );
M_.params( 5 ) = 0.95;
rho = M_.params( 5 );
sigma   = 0.01;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 3 ) = log(ss(1));
oo_.steady_state( 2 ) = log(ss(2));
oo_.steady_state( 5 ) = log(ss(3));
oo_.steady_state( 4 ) = log(ss(4));
oo_.steady_state( 1 ) = log(ss(5));
oo_.steady_state( 7 ) = log(ss(6));
oo_.steady_state( 8 ) = log(ss(7));
oo_.steady_state( 6 ) = oo_.steady_state(1)-oo_.steady_state(5);
oo_.steady_state( 9 ) = 0;
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = sigma^2;
M_.sigma_e_is_diagonal = 1;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
options_.periods = 1000;
var_list_=[];
info = stoch_simul(var_list_);
datatomfile('simuldataRBC',[]);
return;
save('rbcdata_results.mat', 'oo_', 'M_', 'options_');


disp(['Total computing time : ' dynsec2hms(toc) ]);
diary off
