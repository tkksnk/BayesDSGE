x = linspace(0,10,101);
f1 = zeros(101,1);
f2 = zeros(101,1);
f3 = zeros(101,1);
f4 = zeros(101,1);
for i = 1:101
    f1(i) = gampdf(x(i),0.5,1);
    f2(i) = gampdf(x(i),1,1);
    f3(i) = gampdf(x(i),2,1);
    f4(i) = gampdf(x(i),5,1);
end

figure;
plot(x,f1);
hold on;
plot(x,f2);
plot(x,f3);
plot(x,f4);
grid on;
legend('$\mu=0.5,\sigma^2=0.5$',...
    '$\mu=1,\sigma^2=1.0$',...
    '$\mu=2,\sigma^2=2.0$',...
    '$\mu=5,\sigma^2=5.0$',...
    'Interpreter','LaTeX');
xlim([0 10]);
ylim([0 1]);
