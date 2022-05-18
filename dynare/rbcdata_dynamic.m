function [residual, g1, g2, g3] = rbcdata_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
T15 = params(1)*1/exp(y(12));
T29 = params(4)*exp(y(5))^(params(4)-1)*exp(y(14))*exp(y(13))^(1-params(4));
T32 = 1+T29-params(3);
T53 = (1-params(4))*exp(y(11))*exp(y(1))^params(4)*exp(y(7))^(-params(4));
T63 = exp(y(11))*exp(y(1))^params(4)*exp(y(7))^(1-params(4));
lhs =1/exp(y(4));
rhs =T15*T32;
residual(1)= lhs-rhs;
lhs =exp(y(4))*params(2)/(1-exp(y(7)));
rhs =exp(y(9));
residual(2)= lhs-rhs;
lhs =exp(y(9));
rhs =T53;
residual(3)= lhs-rhs;
lhs =exp(y(4))+exp(y(6));
rhs =exp(y(3));
residual(4)= lhs-rhs;
lhs =exp(y(3));
rhs =T63;
residual(5)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(5))-exp(y(1))*(1-params(3));
residual(6)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(3))/exp(y(7));
residual(7)= lhs-rhs;
lhs =exp(y(10));
rhs =params(4)*exp(y(3))/exp(y(1));
residual(8)= lhs-rhs;
lhs =y(11);
rhs =params(5)*y(2)+x(it_, 1);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 15);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-exp(y(4)))/(exp(y(4))*exp(y(4)));
  g1(1,12)=(-(T32*params(1)*(-exp(y(12)))/(exp(y(12))*exp(y(12)))));
  g1(1,5)=(-(T15*exp(y(13))^(1-params(4))*exp(y(14))*params(4)*exp(y(5))*getPowerDeriv(exp(y(5)),params(4)-1,1)));
  g1(1,13)=(-(T15*params(4)*exp(y(5))^(params(4)-1)*exp(y(14))*exp(y(13))*getPowerDeriv(exp(y(13)),1-params(4),1)));
  g1(1,14)=(-(T15*T29));
  g1(2,4)=exp(y(4))*params(2)/(1-exp(y(7)));
  g1(2,7)=(-(exp(y(4))*params(2)*(-exp(y(7)))))/((1-exp(y(7)))*(1-exp(y(7))));
  g1(2,9)=(-exp(y(9)));
  g1(3,1)=(-(exp(y(7))^(-params(4))*(1-params(4))*exp(y(11))*exp(y(1))*getPowerDeriv(exp(y(1)),params(4),1)));
  g1(3,7)=(-((1-params(4))*exp(y(11))*exp(y(1))^params(4)*exp(y(7))*getPowerDeriv(exp(y(7)),(-params(4)),1)));
  g1(3,9)=exp(y(9));
  g1(3,11)=(-T53);
  g1(4,3)=(-exp(y(3)));
  g1(4,4)=exp(y(4));
  g1(4,6)=exp(y(6));
  g1(5,3)=exp(y(3));
  g1(5,1)=(-(exp(y(7))^(1-params(4))*exp(y(11))*exp(y(1))*getPowerDeriv(exp(y(1)),params(4),1)));
  g1(5,7)=(-(exp(y(11))*exp(y(1))^params(4)*exp(y(7))*getPowerDeriv(exp(y(7)),1-params(4),1)));
  g1(5,11)=(-T63);
  g1(6,1)=exp(y(1))*(1-params(3));
  g1(6,5)=(-exp(y(5)));
  g1(6,6)=exp(y(6));
  g1(7,3)=(-(exp(y(3))/exp(y(7))));
  g1(7,7)=(-((-(exp(y(7))*exp(y(3))))/(exp(y(7))*exp(y(7)))));
  g1(7,8)=exp(y(8));
  g1(8,3)=(-(params(4)*exp(y(3))/exp(y(1))));
  g1(8,1)=(-((-(exp(y(1))*params(4)*exp(y(3))))/(exp(y(1))*exp(y(1)))));
  g1(8,10)=exp(y(10));
  g1(9,2)=(-params(5));
  g1(9,11)=1;
  g1(9,15)=(-1);
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,225);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,3375);
end
end
