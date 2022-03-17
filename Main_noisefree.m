% %
% Zhiguo Wang and Bing Zhang
% 2017.5.28
% 
% Wang, Zhiguo, Bing Zhang, Jinghuai Gao, and Qing Huo Liu. 
% A frequency-domain seismic blind deconvolution based on Gini Correlations. 
% Journal of Geophysics and Engineering, 2018,15(1), 286–294.
% %

clc
clear all;
close all;


dt=0.001;
fs=1000;
dx=0.5;
M=1024;
f0=30;
L=35;
iteration=40;



[s,w,we,y,j,S,Y,E]=GiniDecon(dt,dx,M,L,iteration,f0);


figure(1)
subplot(2,1,1)
plot(s/max(s))
title('(a) Original trace');
xlabel('Time (ms)');
ylabel('Amplitude');

subplot(2,1,2)
yout=y(j,:);
yout1=yout/max(yout);
plot(yout1)
title('(b) Deconvolved trace');
xlabel('Time (ms)');
ylabel('Amplitude');





