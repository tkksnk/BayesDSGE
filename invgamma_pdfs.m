x = linspace(0,3,101);
f1 = zeros(101,1);
f2 = zeros(101,1);
f3 = zeros(101,1);
f4 = zeros(101,1);
alpha = [1 2 3 3];
beta = [1 1 1 0.5];
nu = alpha*2;
s = beta*2;
a = sqrt(s./nu);
b = nu;
for i = 1:101
    f1(i) = lnpdfig(x(i),a(1),b(1));
    f2(i) = lnpdfig(x(i),a(2),b(2));
    f3(i) = lnpdfig(x(i),a(3),b(3));
    f4(i) = lnpdfig(x(i),a(4),b(4));
end

E = alpha./(alpha+beta)
V = alpha.*beta./(alpha+beta).^2.*(alpha+beta+1)

figure;
plot(x,exp(f1));
hold on;
plot(x,exp(f2));
plot(x,exp(f3));
plot(x,exp(f4));
grid on;
legend('$\mu=0.50,\sigma^2=0.75$',...
    '$\mu=0.67,\sigma^2=0.89$',...
    '$\mu=0.75,\sigma^2=0.94$',...
    '$\mu=0.86,\sigma^2=0.55$',...
    'Interpreter','LaTeX');
xlim([0 3]);