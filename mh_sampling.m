function [ivec prob] = mh_sampling(pi1,pi2,q,N)

K = zeros(2,2);
K(1,1) = q;
K(1,2) = 1-q;
K(2,1) = (1-q)*pi1/pi2;
K(2,2) = 1-(1-q)*pi1/pi2;

% [V,D] = eig(K');
% D(2,2) = 1 and check its eigenvector 
% V(:,2)./sum(V(:,2));

% simulation
ivec = ones(N,1);
prob = ones(N,1);
cumK= cumsum(K')';

for j = 1:N
    cumKvec = cumK(ivec(j),:);
    ivec(j+1) = sum(rand-cumKvec>=0);
    ivec(j+1) = min(ivec(j+1)+1,2);
    prob(j) = sum(ivec(1:j)==1)/j;
end