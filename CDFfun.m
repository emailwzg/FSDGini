% %
% Zhiguo Wang and Bing Zhang
% 2017.5.28
% 
% Wang, Zhiguo, Bing Zhang, Jinghuai Gao, and Qing Huo Liu. 
% A frequency-domain seismic blind deconvolution based on Gini Correlations. 
% Journal of Geophysics and Engineering, 2018,15(1), 286–294.
% %
function U=CDFfun(x,y);
z=x-y;
for k=1:length(y);
    if z(k)>=0;
        T(k)=1;
    else 
        T(k)=0;
    end
end
U=sum(T)/length(y);