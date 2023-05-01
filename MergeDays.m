%% Merge 8-8, 8-9,8,15, 10-10
clear
close
%% The 8th
disp("Start")
O101=load("C:\Users\buhl5\Desktop\Plan B Files\PMA17\Oct_10_1.mat");
O102=load("C:\Users\buhl5\Desktop\Plan B Files\PMA17\Oct_10_2.mat");
%A83=load("C:\Users\buhl5\Desktop\Plan B Files\Oct_10_3.mat");

Oct_10.Data = struct;
Oct_10.Data.bipolardata.fsample = O101.Data.bipolardata.fsample;
Oct_10.Data.bipolardata.trial{1,1} = cat(2,O101.Data.bipolardata.trial{1,1},O102.Data.bipolardata.trial{1,1});%,A83.Data.bipolardata.trial{1,1});
Oct_10.Data.bipolardata.time{1,1} = cat(1,O101.Data.bipolardata.time{1,1},O102.Data.bipolardata.time{1,1});%,A83.Data.bipolardata.time{1,1});
Oct_10.Data.bipolardata.label = O101.Data.bipolardata.label;
Oct_10.Data.bipolardata.cfg = O101.Data.bipolardata.cfg;

Oct_10.Data.TFR.label = O101.Data.TFR.label;
Oct_10.Data.TFR.dimord = O101.Data.TFR.dimord;
Oct_10.Data.TFR.freq = O101.Data.TFR.freq;
Oct_10.Data.TFR.time = cat(2,O101.Data.TFR.time,O102.Data.TFR.time);%,A83.Data.TFR.time);
Oct_10.Data.TFR.powspctrm = cat(4,O101.Data.TFR.powspctrm,O102.Data.TFR.powspctrm);%,A83.Data.TFR.powspctrm);
Oct_10.Data.TFR.labelcmb = O101.Data.TFR.labelcmb;
Oct_10.Data.TFR.crsspctrm = cat(4,O101.Data.TFR.crsspctrm,O102.Data.TFR.crsspctrm);%,A83.Data.TFR.crsspctrm);
Oct_10.Data.TFR.cumtapcnt = O101.Data.TFR.cumtapcnt;
Oct_10.Data.TFR.cfg = O101.Data.TFR.cfg;

Oct_10.Data.coherence.labelcmb = O101.Data.coherence.labelcmb;
Oct_10.Data.coherence.dimord = O101.Data.coherence.dimord;
Oct_10.Data.coherence.cohspctrm = cat(3, O101.Data.coherence.cohspctrm, O102.Data.coherence.cohspctrm);%, A83.Data.coherence.cohspctrm);
Oct_10.Data.coherence.time = cat(2, O101.Data.coherence.time, O102.Data.coherence.time);%, A83.Data.coherence.time);
Oct_10.Data.coherence.freq = O101.Data.coherence.freq;
Oct_10.Data.coherence.dof = O101.Data.coherence.dof;
Oct_10.Data.coherence.cfg = O101.Data.coherence.cfg;

save("Oct_10.mat","Oct_10","-v7.3")

disp("Done")

%% The 9th
% A91=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_09_1.mat");
% A92=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_09_2.mat");
% A93=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_09_3.mat");
% A94=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_09_4.mat");
% 
% Aug_09.Data = struct;
% Aug_09.Data.bipolardata.fsample = A91.Data.bipolardata.fsample;
% Aug_09.Data.bipolardata.trial{1,1} = cat(2,A91.Data.bipolardata.trial{1,1},A92.Data.bipolardata.trial{1,1},A93.Data.bipolardata.trial{1,1},A94.Data.bipolardata.trial{1,1});
% Aug_09.Data.bipolardata.time{1,1} = cat(1,A91.Data.bipolardata.time{1,1},A92.Data.bipolardata.time{1,1},A93.Data.bipolardata.time{1,1},A94.Data.bipolardata.time{1,1});
% Aug_09.Data.bipolardata.label = A91.Data.bipolardata.label;
% Aug_09.Data.bipolardata.cfg = A91.Data.bipolardata.cfg;
% 
% Aug_09.Data.TFR.label = A91.Data.TFR.label;
% Aug_09.Data.TFR.dimord = A91.Data.TFR.dimord;
% Aug_09.Data.TFR.freq = A91.Data.TFR.freq;
% Aug_09.Data.TFR.time = cat(2,A91.Data.TFR.time,A92.Data.TFR.time,A93.Data.TFR.time,A94.Data.TFR.time);
% Aug_09.Data.TFR.powspctrm = cat(4,A91.Data.TFR.powspctrm,A92.Data.TFR.powspctrm,A93.Data.TFR.powspctrm,A94.Data.TFR.powspctrm);
% Aug_09.Data.TFR.labelcmb = A91.Data.TFR.labelcmb;
% Aug_09.Data.TFR.crsspctrm = cat(4,A91.Data.TFR.crsspctrm,A92.Data.TFR.crsspctrm,A93.Data.TFR.crsspctrm,A94.Data.TFR.crsspctrm);
% Aug_09.Data.TFR.cumtapcnt = A91.Data.TFR.cumtapcnt;
% Aug_09.Data.TFR.cfg = A91.Data.TFR.cfg;
% 
% Aug_09.Data.coherence.labelcmb = A91.Data.coherence.labelcmb;
% Aug_09.Data.coherence.dimord = A91.Data.coherence.dimord;
% Aug_09.Data.coherence.cohspctrm = cat(3, A91.Data.coherence.cohspctrm, A92.Data.coherence.cohspctrm, A93.Data.coherence.cohspctrm, A94.Data.coherence.cohspctrm);
% Aug_09.Data.coherence.time = cat(2, A91.Data.coherence.time, A92.Data.coherence.time, A93.Data.coherence.time, A94.Data.coherence.time);
% Aug_09.Data.coherence.freq = A91.Data.coherence.freq;
% Aug_09.Data.coherence.dof = A91.Data.coherence.dof;
% Aug_09.Data.coherence.cfg = A91.Data.coherence.cfg;
% 
% save("Aug_09.mat","Aug_09","-v7.3")
% 
% 
% 
% %% The 15th
% 
% A151=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_15_1.mat");
% A152=load("C:\Users\buhl5\Desktop\Plan B Files\Aug_15_2.mat");
% 
% Aug_15.Data = struct;
% Aug_15.Data.bipolardata.fsample = A151.Data.bipolardata.fsample;
% Aug_15.Data.bipolardata.trial{1,1} = cat(2,A151.Data.bipolardata.trial{1,1},A152.Data.bipolardata.trial{1,1});
% Aug_15.Data.bipolardata.time{1,1} = cat(1,A151.Data.bipolardata.time{1,1},A152.Data.bipolardata.time{1,1});
% Aug_15.Data.bipolardata.label = A151.Data.bipolardata.label;
% Aug_15.Data.bipolardata.cfg = A151.Data.bipolardata.cfg;
% 
% Aug_15.Data.TFR.label = A151.Data.TFR.label;
% Aug_15.Data.TFR.dimord = A151.Data.TFR.dimord;
% Aug_15.Data.TFR.freq = A151.Data.TFR.freq;
% Aug_15.Data.TFR.time = cat(2,A151.Data.TFR.time,A152.Data.TFR.time);
% Aug_15.Data.TFR.powspctrm = cat(4,A151.Data.TFR.powspctrm,A152.Data.TFR.powspctrm);
% Aug_15.Data.TFR.labelcmb = A151.Data.TFR.labelcmb;
% Aug_15.Data.TFR.crsspctrm = cat(4,A151.Data.TFR.crsspctrm,A152.Data.TFR.crsspctrm);
% Aug_15.Data.TFR.cumtapcnt = A151.Data.TFR.cumtapcnt;
% Aug_15.Data.TFR.cfg = A151.Data.TFR.cfg;
% 
% Aug_15.Data.coherence.labelcmb = A151.Data.coherence.labelcmb;
% Aug_15.Data.coherence.dimord = A151.Data.coherence.dimord;
% Aug_15.Data.coherence.cohspctrm = cat(3, A151.Data.coherence.cohspctrm, A152.Data.coherence.cohspctrm);
% Aug_15.Data.coherence.time = cat(2, A151.Data.coherence.time, A152.Data.coherence.time);
% Aug_15.Data.coherence.freq = A151.Data.coherence.freq;
% Aug_15.Data.coherence.dof = A151.Data.coherence.dof;
% Aug_15.Data.coherence.cfg = A151.Data.coherence.cfg;
% 
% save("Aug_15.mat","Aug_15","-v7.3")
% 
