% %
% Zhiguo Wang and Bing Zhang
% 2017.5.28
% 
% Wang, Zhiguo, Bing Zhang, Jinghuai Gao, and Qing Huo Liu. 
% A frequency-domain seismic blind deconvolution based on Gini Correlations. 
% Journal of Geophysics and Engineering, 2018,15(1), 286–294.
% %

function [s,w,we,y,j,S,Y,E]=GiniDecon(dt,dx,M,L,iteration,f0,r);



w=rickerfun(dt,L,f0,0);

r=normrnd(0,0.28,1,150).^3;

s1=conv(w,r);

s=s1;
S=fft(s,M);

j=sqrt(-1);
F=j*2*pi*[0:M-1]/(M);
Z=exp(F);

for k=1:iteration;
    n(k)=0.1*k;
    T=cos(2*pi*f0*dt);
    m(k)=(1+T)*n(k)/(1-T);
    G1(k,:)=((1+Z).^m(k)).*((1-Z).^n(k));
    U(k)=sum(abs(G1(k,:)).^2).^0.5;
    G(k,:)=G1(k,:)/U(k);
    H(k,:)=abs(G(k,:))./(abs(G(k,:)).^2+0.000005);
    Y(k,:)=S.*H(k,:);
    y1(k,:)=real(ifft(Y(k,:),M));
    y2(k,:)=y1(k,1:length(s));
    y(k,:)=y2(k,:)/sum(y2(k,:).^2).^0.5;
    E(k)=abs(Ginifun(y(k,:),y(k,:)));
end

[i,j]=min(E);
we1=real(ifft(abs(G(j,:)),M));
w1=circshift(we1',M/2);
[p1,p2]=max(abs(w1));
we=w1(p2-L:p2+L);




