% %
% Zhiguo Wang and Bing Zhang
% 2017.5.28
% 
% Wang, Zhiguo, Bing Zhang, Jinghuai Gao, and Qing Huo Liu. 
% A frequency-domain seismic blind deconvolution based on Gini Correlations. 
% Journal of Geophysics and Engineering, 2018,15(1), 286–294.
% %
function g=Ginifun(x,y);
for k=1:length(y);
U(k)=CDFfun(y(k),y);
end
g=sum(x.*(U-0.5))/length(x);%Gini Correlations