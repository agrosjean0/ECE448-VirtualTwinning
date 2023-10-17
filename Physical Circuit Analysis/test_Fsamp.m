clear
clc

%% Initial cnd
t_low = -1.0093E-5;
t_high = -1.01042E-5;
t_rise = abs(t_high-t_low);
% circuit component values
vin = 24;     % input DC voltage
Rdson = 0.1;  % transistor ESR (estimated)
RL = 0.2;     % inductor ESR (estimated)
RC_det = 0.12; % increases pk to pk amp & decreases roundness
RC = 0.01+RC_det;    % capacitor ESR (estimated)
R = 10.9;       % load resistance
L = 0.0001;   % inductance
C_det = 0.0000; % increases pk to pk amp & roundness
C = 0.0001-C_det;   % capacitance
VF = 0.7;     % diode forward voltage

% initial cicuit AC conditions
iL = 0;       % initial inductor current
vC = 0;       % initial capacitor voltage

% switch waveform
fsw = 50000;  % 50 kHz switching freq
fsamp = 100E6; % sample rate of 100 MHz
Tstep = 1/fsamp; % dt iteration step
D = 0.5;      % duty cycle

%% Switch
Tsw = 1/fsw;
sim_time = 0.1;
t = 0:Tstep:sim_time-Tstep;
t_per = 0:Tstep:Tsw-Tstep;
S = mod(t,Tsw)>Tsw*D; % PWM waveform
% S1 = t_per<(D*Tsw-t_rise/2);
% S2 = t_per>(D*Tsw+t_rise/2);
% t(t_per>(D*Tsw+t_rise/2)) = 1;

%% Circuit analysis
vals = zeros([3 size(S,2)]);
vo = zeros([1 size(S,2)]);

  % switch independent component
  A = S.*Rdson + RL + RC*R/(RC + R);
  Se = [-A(1)./L (-1/L*(R/(RC+R)));
      (1/C*(R/(RC+R))) -(1/C*(1/(RC+R)));
      (RC*R/(RC+R)) R/(RC+R)];
  % switch dependent components
  Son = S.*[vin/L;0;0];
  Soff = (1-S).*[-VF/L;0;0];
for itr = 1:size(S,2)
    Se(1) = -A(itr)/L;
    % calculate change 
    vals = Se*[iL;vC] + Son(:,itr) + Soff(:,itr);
    iL = Tstep*vals(1) + iL;
    vC = Tstep*vals(2) + vC;
    vo(itr) = vals(3);
end

%% Plot results
% output voltage
figure
subplot(211)
plot(t,vo)
title('Output voltage')
xlabel('Time (s)')
ylabel('Voltage (V)')

% show n switch cycles
n = 20;
subplot(212)
plot(t,vo)
ylim([11.42 11.48])
xlim([0.01 0.01+Tsw*n])
title('Output voltage ripple')
xlabel('Time (s)')
ylabel('Voltage (V)')

%% Plot vc Physical
ps = 0;
vo_samp = vo(1,(ps)+(sim_time*1/Tstep)-2E4:(ps)+round(sim_time*1/Tstep-1E4));

figure
Tvc = table2array(readtable('V2_DC.csv'));
vc = Tvc(14:10013,2);
tc = Tvc(14:10013,1);
vc_dc = sum(vc)/10000;
% plot(tc,vc)
% title("VC")
% ylabel(string(vc_dc),'FontWeight','bold','Rotation',0)

Tvc = table2array(readtable('V2_AC.csv'));
vc = Tvc(14:10013,2);
tc = Tvc(14:10013,1);
plot(vc+vc_dc)
hold on
plot(vo_samp)
title("VC")