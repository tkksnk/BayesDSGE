clear all;

pi1 = 0.2;
pi2 = 1-pi1;
q = 0.33;
N = 100000;

% MH sampling
[ivec1 prob1] = mh_sampling(pi1,pi2,0,N);
[ivec2 prob2] = mh_sampling(pi1,pi2,0.33,N);
[ivec3 prob3] = mh_sampling(pi1,pi2,0.66,N);
[ivec4 prob4] = mh_sampling(pi1,pi2,0.99,N);
[ivec0 prob0] = mh_sampling(pi1,pi2,pi1,N);

% figure;
% plot(ivec1(1:1000));
% % hold on;
% % plot(ivec2(1:1000));
% % plot(ivec3(1:1000));
% % plot(ivec4(1:1000));
% legend('q=0','q=0.33','q=0.66','q=0.99');

figure;
plot(prob1(1:1000));
hold on;
plot(prob2(1:1000));
plot(prob3(1:1000));
plot(prob4(1:1000));
plot(prob0(1:1000));
plot([1 1000],[pi1,pi1],'k-');
%legend('q=0','q=0.33','q=0.66','q=0.99');
legend('$q=0$','$q=0.33$','$q=0.66$','$q=0.99$','$q=\pi_{1}$','Interpreter','latex');

corr1 = zeros(10,1);
corr2 = zeros(10,1);
corr3 = zeros(10,1);
corr4 = zeros(10,1);
corr0 = zeros(10,1);
for i = 0:9
    corr1(i+1) = corr(ivec1(1:end-i),ivec1(1+i:end));
    corr2(i+1) = corr(ivec2(1:end-i),ivec2(1+i:end));
    corr3(i+1) = corr(ivec3(1:end-i),ivec3(1+i:end));
    corr4(i+1) = corr(ivec4(1:end-i),ivec4(1+i:end));
    corr0(i+1) = corr(ivec0(1:end-i),ivec0(1+i:end));
end

figure;
plot([0:9],corr1);
hold on;
plot([0:9],corr2);
plot([0:9],corr3);
plot([0:9],corr4);
plot([0:9],corr0);
legend('$q=0$','$q=0.33$','$q=0.66$','$q=0.99$','$q=\pi_{1}$','Interpreter','latex');
