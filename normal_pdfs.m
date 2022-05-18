x = linspace(-5,5,101);
f1 = zeros(101,1);
f2 = zeros(101,1);
f3 = zeros(101,1);
f4 = zeros(101,1);
for i = 1:101
    f1(i) = normpdf(x(i),0,sqrt(0.2));
    f2(i) = normpdf(x(i),0,sqrt(1.0));
    f3(i) = normpdf(x(i),0,sqrt(5.0));
    f4(i) = normpdf(x(i),-2,sqrt(0.5));
end

figure;
plot(x,f1);
hold on;
plot(x,f2);
plot(x,f3);
plot(x,f4);
grid on;
legend('$\mu=0,\sigma^2=0.2$',...
    '$\mu=0,\sigma^2=1.0$',...
    '$\mu=0,\sigma^2=5.0$',...
    '$\mu=-2,\sigma^2=0.5$',...
    'Interpreter','LaTeX');
xlim([-5 5]);
ylim([0 1]);
