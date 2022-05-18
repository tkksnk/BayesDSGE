x = linspace(0,1,101);
f1 = zeros(101,1);
f2 = zeros(101,1);
f3 = zeros(101,1);
f4 = zeros(101,1);
for i = 1:101
    f1(i) = betapdf(x(i),0.5,0.5);
    f2(i) = betapdf(x(i),0.5,2);
    f3(i) = betapdf(x(i),2,0.5);
    f4(i) = betapdf(x(i),2,2);
end

alpha = [0.5 0.5 2 2];
beta = [0.5 2 0.5 2];
E = alpha./(alpha+beta)
V = alpha.*beta./(alpha+beta).^2.*(alpha+beta+1)

figure;
plot(x,f1);
hold on;
plot(x,f2);
plot(x,f3);
plot(x,f4);
grid on;
legend('$\mu=0.5,\sigma^2=0.50$',...
    '$\mu=0.2,\sigma^2=0.56$',...
    '$\mu=0.8,\sigma^2=0.56$',...
    '$\mu=0.5,\sigma^2=1.25$',...
    'Interpreter','LaTeX');
xlim([0 1]);
% ylim([0 1]);
