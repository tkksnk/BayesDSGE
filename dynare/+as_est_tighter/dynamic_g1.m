function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = as_est_tighter.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 19);
g1(1,6)=1;
g1(1,15)=(-1);
g1(1,16)=(-T(2));
g1(1,8)=T(2);
g1(1,9)=(-(1-params(6)));
g1(1,10)=(-(params(7)/params(1)));
g1(2,6)=(-params(2));
g1(2,7)=1;
g1(2,16)=(-T(1));
g1(2,9)=params(2);
g1(3,1)=(-params(5));
g1(3,5)=1;
g1(3,6)=(-((1-params(5))*params(4)));
g1(3,7)=(-((1-params(5))*params(3)));
g1(3,9)=(1-params(5))*params(4);
g1(3,11)=(-1);
g1(4,5)=(-1);
g1(4,8)=1;
g1(5,3)=(-params(6));
g1(5,9)=1;
g1(5,17)=(-1);
g1(6,4)=(-params(7));
g1(6,10)=1;
g1(6,18)=(-1);
g1(7,11)=1;
g1(7,19)=(-1);
g1(8,2)=1;
g1(8,6)=(-1);
g1(8,10)=(-1);
g1(8,12)=1;
g1(9,7)=(-4);
g1(9,13)=1;
g1(10,8)=(-4);
g1(10,14)=1;

end
