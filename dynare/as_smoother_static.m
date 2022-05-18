function [residual, g1, g2] = as_smoother_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 9, 1);

%
% Model equations
%

bet__ = 1/(1+params(8)/400);
T15 = 1/params(1);
residual(1) = y(1)+T15*y(3)-(1-params(6))*y(4)-params(7)/params(1)*y(5)-y(1)-T15*y(2);
lhs =y(2);
rhs =params(2)*(y(1)-y(4))+y(2)*bet__;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(5)+y(2)*(1-params(5))*params(3)+(y(1)-y(4))*(1-params(5))*params(4)+y(6);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =params(6)*y(4)+x(1);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =params(7)*y(5)+x(2);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =x(3);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(5)+params(10);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(2)*4+params(9);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(3)*4+params(8)+params(9)+params(10)*4;
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-T15);
  g1(1,3)=T15;
  g1(1,4)=(-(1-params(6)));
  g1(1,5)=(-(params(7)/params(1)));
  g1(2,1)=(-params(2));
  g1(2,2)=1-bet__;
  g1(2,4)=params(2);
  g1(3,1)=(-((1-params(5))*params(4)));
  g1(3,2)=(-((1-params(5))*params(3)));
  g1(3,3)=1-params(5);
  g1(3,4)=(1-params(5))*params(4);
  g1(3,6)=(-1);
  g1(4,4)=1-params(6);
  g1(5,5)=1-params(7);
  g1(6,6)=1;
  g1(7,5)=(-1);
  g1(7,7)=1;
  g1(8,2)=(-4);
  g1(8,8)=1;
  g1(9,3)=(-4);
  g1(9,9)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
end
end
