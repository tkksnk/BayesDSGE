function [residual, g1, g2, g3] = as_smoother_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
bet__ = 1/(1+params(8)/400);
T15 = 1/params(1);
residual(1) = y(5)+T15*y(7)-(1-params(6))*y(8)-params(7)/params(1)*y(9)-y(14)-T15*y(15);
lhs =y(6);
rhs =params(2)*(y(5)-y(8))+y(15)*bet__;
residual(2)= lhs-rhs;
lhs =y(7);
rhs =params(5)*y(2)+y(6)*(1-params(5))*params(3)+(y(5)-y(8))*(1-params(5))*params(4)+y(10);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(6)*y(3)+x(it_, 1);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =params(7)*y(4)+x(it_, 2);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =x(it_, 3);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(9)+y(5)-y(1)+params(10);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(6)*4+params(9);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =y(7)*4+params(8)+params(9)+params(10)*4;
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 18);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,14)=(-1);
  g1(1,15)=(-T15);
  g1(1,7)=T15;
  g1(1,8)=(-(1-params(6)));
  g1(1,9)=(-(params(7)/params(1)));
  g1(2,5)=(-params(2));
  g1(2,6)=1;
  g1(2,15)=(-bet__);
  g1(2,8)=params(2);
  g1(3,5)=(-((1-params(5))*params(4)));
  g1(3,6)=(-((1-params(5))*params(3)));
  g1(3,2)=(-params(5));
  g1(3,7)=1;
  g1(3,8)=(1-params(5))*params(4);
  g1(3,10)=(-1);
  g1(4,3)=(-params(6));
  g1(4,8)=1;
  g1(4,16)=(-1);
  g1(5,4)=(-params(7));
  g1(5,9)=1;
  g1(5,17)=(-1);
  g1(6,10)=1;
  g1(6,18)=(-1);
  g1(7,1)=1;
  g1(7,5)=(-1);
  g1(7,9)=(-1);
  g1(7,11)=1;
  g1(8,6)=(-4);
  g1(8,12)=1;
  g1(9,7)=(-4);
  g1(9,13)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,324);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,5832);
end
end
