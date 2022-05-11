clear all;

phibar = -0.5;
Vbar1 = 1/4;

% the exact shape from pdf (analytical)
theta = linspace(-3,3,1001)';
pi = zeros(1001,1);

for i = 1:1001

    pi(i) = normpdf((theta(i)-phibar)/sqrt(Vbar1));

end

% direct sampling
N = 500000;
theta_ds = zeros(N,1);

for i = 1:N
   theta_ds(i) = phibar + sqrt(Vbar1)*randn;
end

figure;
subplot(211);
plot(theta,pi,'k-','LineWidth',2);
subplot(212);
hist(theta_ds,1000);
xlim([-3,3]);

mean(theta_ds)