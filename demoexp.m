%demo for Greedy Algorithms for Non linear sparse recovery Exponential function y=exp(Ax)
clc;
clear all;
close all;
n=60; %number of measurements
k=5; %number of non zero values in the sparse vector;
x0 = zeros(100,1);
t = randperm(100);
%measurement matrix
A = rand(n,100); 
x0(t(1:k)) = 0.6*rand(k,1);   %sparse vector of length 100 with k non zero values
y =exp(A*x0);         %non linear exponential function f(x)=exp(Ax)

myfun = @(A,x0) norm(y-exp(A*x0),2); %function handle for ||y-f(x)||
x1=OMPE(A,myfun,k); %recovered vector from greedy OMP algorithm for non linear function
x2=coSAMPL(A,k,myfun); %recovered vector from greedy COSAMP algorithm for non linear function

stem(x0); hold on ; stem(x1,'r+');title('Greedy algorithm OMP for Exponential');
figure;
stem(x0); hold on; stem(x2,'r+'); title('Greedy Algorithm COSAMP for Exponential');
