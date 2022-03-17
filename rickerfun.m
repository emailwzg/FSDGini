% %
% Zhiguo Wang and Bing Zhang
% 2017.5.28
% 
% Wang, Zhiguo, Bing Zhang, Jinghuai Gao, and Qing Huo Liu. 
% A frequency-domain seismic blind deconvolution based on Gini Correlations. 
% Journal of Geophysics and Engineering, 2018,15(1), 286–294.
% %

function s=rickerfun(dt,L,f,fa);
t=-L*dt:dt:L*dt;
s=(1-2*(pi*f)^2*t.^2).*exp(-(pi*f)^2*t.^2);




