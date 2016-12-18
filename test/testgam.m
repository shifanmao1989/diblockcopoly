clear;
%close all
addpath('../functions')
addpath('../chainstats')
addpath('../misc')
addpath('../chainstats/eigcalc')
addpath('../chainstats/integrals')

NRR = 50;
FAV = 0.50;

NN = 10;
NV = logspace(0,2,NN);

%NN = 1;
%NV = 1e-2;
chisv = zeros(NN,1);
ksv = zeros(NN,1);
d2gam2v = zeros(NN,1);
gam4v = zeros(NN,1);
for I = 1:NN
I	  
N = NV(I);

% Figure 8-9: vertex functions
NQ=1;  % number of wavevector sets in calculating GAM4
[chis,ks,d2gam2]=spinodal(N,0.5);
[gam3,gam4]=calcgamma(N,FAV,NQ);

if N<=1e-2
  ksv(I)=ks*NRR;
  d2gam2v(I)=d2gam2;
  chisv(I)=chis*NRR;
  %NRR*gam4/power(d2gam2/2,2)
  gam4v(I)=gam4*NRR;
else
  ksv(I)=ks*N;
  d2gam2v(I)=d2gam2;
  chisv(I)=chis*N;
  gam4v(I)=gam4*N;
end
    
end
