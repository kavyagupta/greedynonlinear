%demo for Greedy algorithms for Non linear sparse recovery logarithmic
%function y=log(Ax);
close all;
clear all;
n=60; %number of measurements
k=5; %number of non zero values in the sparse vector;
x0 = zeros(100,1);
t = randperm(100);
%measurement matrix
A = rand(n,100); 
x0(t(1:k)) = 0.6*rand(k,1)+0.25;  %sparse vector of length 100
y =log(A*x0);      %non-linear logarithmic function f(x)=log(Ax)
myfun = @(A,x0) norm(y-log(A*x0),2);   %function handle for ||y-f(x)||
x1=OMPL(A,myfun,k);    %recovered vector from greedy OMP algorithm for non linear function
x2=coSAMPL(A,k,myfun); %recovered vector greedy COSAMP algorithm for non linear function
stem(x0); hold on ; stem(x1,'r+');title('Greedy algorithm OMP for logarithmic');
figure;
stem(x0); hold on; stem(x2,'r+'); title('Greedy Algorithm COSAMP for logarithmic');
