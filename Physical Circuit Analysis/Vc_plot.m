clear
clc

figure

Tvc = table2array(readtable('V2_DC.csv'));
TiL = table2array(readtable('CS5_DC.csv'));
Tic = table2array(readtable('CS4_DC.csv')); 

%Rcs = 0.1;

vc = Tvc(14:10013,2);
tc = Tvc(14:10013,1);
vc_dc = sum(vc)/10000;
subplot(231)
plot(tc,vc)
title("VC")
ylabel(string(vc_dc),'FontWeight','bold','Rotation',0)

iL = TiL(14:10013,2);
tL = TiL(14:10013,1);
iL_dc = sum(iL)/10000;
subplot(232)
plot(tL,iL)
title("IL")
ylabel(string(iL_dc),'FontWeight','bold','Rotation',0)

ic = Tic(14:10013,2);
tci = Tic(14:10013,1);
ic_dc = sum(ic)/10000;
subplot(233)
plot(tci,ic)
title("IC")
ylabel(string(ic_dc),'FontWeight','bold','Rotation',0)





Tvc = table2array(readtable('V2_AC.csv'));
TiL = table2array(readtable('CS5_AC.csv'));
Tic = table2array(readtable('CS4_AC.csv')); 

%Rcs = 0.1;

vc = Tvc(14:10013,2);
tc = Tvc(14:10013,1);
subplot(234)
plot(tc,vc)
title("VC")

iL = TiL(14:10013,2);
tL = TiL(14:10013,1);
subplot(235)
plot(tL,iL)
title("IL")

ic = Tic(14:10013,2);
tci = Tic(14:10013,1);
subplot(236)
plot(tci,ic)
title("IC")

%% Average to smooth out ADC sample
% samps = 5;
% for n=0:(10000/samps-1)
%     vc1(n+1) = sum(vc((samps*n)+1:(samps*n)+samps))/samps;
%     ic1(n+1) = sum(ic((samps*n)+1:(samps*n)+samps))/samps;
% end
% 
% % Ic = C (dVc/dt)
% dvc = [diff(vc1) 0];
% C = ic1./dvc;
% figure
% subplot(121)
% plot(C)
% subplot(122)
% plot(dvc)
% 
% median(C)