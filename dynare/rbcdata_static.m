function [residual, g1, g2] = rbcdata_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 9, 1);

%
% Model equations
%

T12 = 1/exp(y(2))*params(1);
T25 = exp(y(5))^(1-params(4));
T26 = params(4)*exp(y(3))^(params(4)-1)*exp(y(9))*T25;
T29 = 1+T26-params(3);
T44 = exp(y(9))*(1-params(4))*exp(y(3))^params(4)*exp(y(5))^(-params(4));
lhs =1/exp(y(2));
rhs =T12*T29;
residual(1)= lhs-rhs;
lhs =exp(y(2))*params(2)/(1-exp(y(5)));
rhs =exp(y(7));
residual(2)= lhs-rhs;
lhs =exp(y(7));
rhs =T44;
residual(3)= lhs-rhs;
lhs =exp(y(2))+exp(y(4));
rhs =exp(y(1));
residual(4)= lhs-rhs;
lhs =exp(y(1));
rhs =T25*exp(y(9))*exp(y(3))^params(4);
residual(5)= lhs-rhs;
lhs =exp(y(4));
rhs =exp(y(3))-exp(y(3))*(1-params(3));
residual(6)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(1))/exp(y(5));
residual(7)= lhs-rhs;
lhs =exp(y(8));
rhs =params(4)*exp(y(1))/exp(y(3));
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(5)+x(1);
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-exp(y(2)))/(exp(y(2))*exp(y(2)))-T29*params(1)*(-exp(y(2)))/(exp(y(2))*exp(y(2)));
  g1(1,3)=(-(T12*T25*exp(y(9))*params(4)*exp(y(3))*getPowerDeriv(exp(y(3)),params(4)-1,1)));
  g1(1,5)=(-(T12*params(4)*exp(y(3))^(params(4)-1)*exp(y(9))*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(4),1)));
  g1(1,9)=(-(T12*T26));
  g1(2,2)=exp(y(2))*params(2)/(1-exp(y(5)));
  g1(2,5)=(-(exp(y(2))*params(2)*(-exp(y(5)))))/((1-exp(y(5)))*(1-exp(y(5))));
  g1(2,7)=(-exp(y(7)));
  g1(3,3)=(-(exp(y(5))^(-params(4))*exp(y(9))*(1-params(4))*exp(y(3))*getPowerDeriv(exp(y(3)),params(4),1)));
  g1(3,5)=(-(exp(y(9))*(1-params(4))*exp(y(3))^params(4)*exp(y(5))*getPowerDeriv(exp(y(5)),(-params(4)),1)));
  g1(3,7)=exp(y(7));
  g1(3,9)=(-T44);
  g1(4,1)=(-exp(y(1)));
  g1(4,2)=exp(y(2));
  g1(4,4)=exp(y(4));
  g1(5,1)=exp(y(1));
  g1(5,3)=(-(T25*exp(y(9))*exp(y(3))*getPowerDeriv(exp(y(3)),params(4),1)));
  g1(5,5)=(-(exp(y(9))*exp(y(3))^params(4)*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(4),1)));
  g1(5,9)=(-(T25*exp(y(9))*exp(y(3))^params(4)));
  g1(6,3)=(-(exp(y(3))-exp(y(3))*(1-params(3))));
  g1(6,4)=exp(y(4));
  g1(7,1)=(-(exp(y(1))/exp(y(5))));
  g1(7,5)=(-((-(exp(y(5))*exp(y(1))))/(exp(y(5))*exp(y(5)))));
  g1(7,6)=exp(y(6));
  g1(8,1)=(-(params(4)*exp(y(1))/exp(y(3))));
  g1(8,3)=(-((-(exp(y(3))*params(4)*exp(y(1))))/(exp(y(3))*exp(y(3)))));
  g1(8,8)=exp(y(8));
  g1(9,9)=1-params(5);
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
