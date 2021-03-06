%this code tests the calculation of 2-point correlation
clear;
addpath(genpath('../chainstats'))
addpath('../misc')

%Chain structural information
N=1e1;
NRR=20;

%Chain chemical information
FA=0.3;

% parameters for WLC calculations
ORDEig=10;
NumLayer=500;

%wavevector
% k=linspace(1e-2,10,100)';
k=logspace(-2,4,100)';

%%%% Gaussian Chain %%%%
%calculate s2
g2gc=zeros(length(k),2,2);
g2wlc=zeros(length(k),2,2);
g2rr=zeros(length(k),2,2);
for ii=1:length(k)
    g2gc(ii,:,:) = s2gc(N,FA,k(ii))/power(N,2);
    g2wlc(ii,:,:) = s2wlc(N,FA,k(ii))/power(N,2);
%     g2rr(ii,:,:) = s2rr(NRR,FA,k(ii))/power(NRR,2);
end

%make plots
% figure;hold;set(gca,'fontsize',15);
% plot(k,g2gc(:,1,1).*k*N,'k-',...
%      k,g2gc(:,2,2).*k*N,'r-',...
%      k,g2gc(:,1,2).*k*N,'k--','linewidth',2);
% plot(k,g2wlc(:,1,1).*k*N,'b-',...
%      k,g2wlc(:,2,2).*k*N,'r-',...
%      k,g2wlc(:,1,2).*k*N,'b--','linewidth',2);
%
% plot([0,10],[pi,pi],'k:');
% set(gca,'xscale','linear');set(gca,'yscale','linear');
% axis([0,10,0,20]);
% xlabel('K');ylabel('SkL');box on



figure;hold;set(gca,'fontsize',15);
plot(k,g2gc(:,1,1),'k-',...
     k,g2gc(:,2,2),'r-',...
     k,g2gc(:,1,2),'b-','linewidth',2);
plot(k,g2wlc(:,1,1),'k--',...
     k,g2wlc(:,2,2),'r--',...
     k,g2wlc(:,1,2),'b--','linewidth',2);
set(gca,'xscale','log');set(gca,'yscale','log')
box on