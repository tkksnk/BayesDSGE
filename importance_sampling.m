clear all;

phibar = -0.5;
Vbar1 = 1/4;
Vbar2 = 1/20;
Vbar3 = 1/100;

% the exact shape (analytical)
theta = linspace(-2,2,1001)';
pi1 = zeros(1001,1);
pi2 = zeros(1001,1);
pi3 = zeros(1001,1);
g1 = zeros(1001,1);
g2 = zeros(1001,1);

for i = 1:1001

    pi1(i) = normcdf((theta(i)-phibar)/sqrt(Vbar1))-normcdf((theta(i)-1-phibar)/sqrt(Vbar1));
    pi2(i) = normcdf((theta(i)-phibar)/sqrt(Vbar2))-normcdf((theta(i)-1-phibar)/sqrt(Vbar2));
    pi3(i) = normcdf((theta(i)-phibar)/sqrt(Vbar3))-normcdf((theta(i)-1-phibar)/sqrt(Vbar3));
    
    g1(i) = normpdf((theta(i)-0.5)/sqrt(0.125));
    g2(i) = normpdf((theta(i)-0.5)/sqrt(0.5));

end

% figure;
% plot(theta,pi1,'r-','LineWidth',2);
% hold on;
% plot(theta,pi2,'b--','LineWidth',2);
% plot(theta,pi3,'g:','LineWidth',2);
% legend('$\bar{V}_{\phi}=1/4$','$\bar{V}_{\phi}=1/20$','$\bar{V}_{\phi}=1/100$','Interpreter','latex');
% 
% figure;
% plot(theta,pi3,'b-','LineWidth',2);
% hold on;
% plot(theta,g1,'r--','LineWidth',2);
% plot(theta,g2,'r:','LineWidth',2);

% % direct sampling
% N = 1000000;
% phi_ds = zeros(N,1);
% theta_ds = zeros(N,1);
% 
% for i = 1:N
%    phi_ds(i) = phibar + sqrt(Vbar1)*randn;
%    theta_ds(i) = phi_ds(i) + rand;
% end
% 
% mean(theta_ds)
% mean(theta_ds.^2)
% % 
% % figure;
% % hist(theta_ds,1000);

% importance sampling
N = 50000;
theta1_is = zeros(N,1);
theta2_is = zeros(N,1);
w1_is = zeros(N,1);
w2_is = zeros(N,1);

for i = 1:N
   theta1_is(i) = 0.5 + sqrt(0.125)*randn;
   theta2_is(i) = 0.5 + sqrt(0.5)*randn;
   f1 = normcdf((theta1_is(i)-phibar)/sqrt(Vbar3))-normcdf((theta1_is(i)-1-phibar)/sqrt(Vbar3));
   f2 = normcdf((theta2_is(i)-phibar)/sqrt(Vbar3))-normcdf((theta2_is(i)-1-phibar)/sqrt(Vbar3));
   g1 = normpdf((theta1_is(i)-0.5)/sqrt(0.125));
   g2 = normpdf((theta2_is(i)-0.5)/sqrt(0.5));
   w1_is(i) = f1/g1;
   w2_is(i) = f2/g2;
end

W1_is = w1_is./sum(w1_is);
W2_is = w2_is./sum(w2_is);
% resampling
theta1_is_resample = randsample(theta1_is,N,true,W1_is);
theta2_is_resample = randsample(theta2_is,N,true,W2_is);

figure;
subplot(311);
plot(theta,pi3,'k-','LineWidth',2);
subplot(312);
hist(theta1_is_resample,1000);
xlim([-2,2]);
subplot(313);
hist(theta2_is_resample,1000);
xlim([-2,2]);
