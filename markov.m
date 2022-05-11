clear all;

A = [0.8 0.2;
    0.5 0.5];

% eigenvalue and eigenvector
[V D] = eig(A')
V(:,1)/sum(V(:,1))

% simulation
pi = [0.9; 0.1];
for i = 1:10000
    pi = A'*pi; % gather (1->1) and (2->1) to pi(1)
end
pi