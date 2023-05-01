%% Creating Table for use in GLM
clear; clc; close
daynum = 7;
%% Data and Events
filename = "C:\Users\buhl5\Desktop\Plan B Files\PMA17\Oct_10_table.csv";

path = 'C:\Users\buhl5\Desktop\Plan B Files\PMA17\10_10_LOG_PMA17.csv';
load("C:\Users\buhl5\Desktop\Plan B Files\PMA17\Oct_10.mat");

Data = Oct_10.Data; %For patched together structures such as 8/8


%events = loadEventsGoogle(path);

twindowindexcoh = findindex(events,Data.coherence.time,3,27,"seconds"); %Index for 20 Hz rate
twindowindexbp = findindex(events,Data.bipolardata.time{1,1}',3,27,"seconds"); %Index for 1000 Hz rate
%events = pullevents(path,fast); Need to fix this function for PyBehav 2

disp('Data read in')

%%
%Placeholders will need to test to decide which channels are best
ILchan = 1;
PLchan = 5;
BLAchan = 9;

%Coherence selected based on above channels
ILBLAchan = 33;
PLBLAchan = 1;
ILPLchan = 65;

%% Grab the correct sections
power = squeeze(Data.TFR.powspctrm);

%This is at 20 Hz
ILBLA = squeeze(Data.coherence.cohspctrm(ILBLAchan,:,:));
PLBLA = squeeze(Data.coherence.cohspctrm(PLBLAchan,:,:));
ILPL = squeeze(Data.coherence.cohspctrm(ILPLchan,:,:));
%COHtime = Data.coherence.time;

ILpow = squeeze(power(ILchan,:,:));
PLpow = squeeze(power(PLchan,:,:));
BLApow = squeeze(power(BLAchan,:,:));


%% Define 1 second bins
% Add loop for Day
% for daynum in 1:length(path)

%Delta 1-4 
%Theta 5-8
%Alpha 9-13
%Low Beta 14-19
%Mid Beta 20-25
%High Beta 26-30

band_groups = {1:4; 5:8; 9:13; 14:19; 20:25; 26:30};
band_names = {'Delta','Theta','Alpha','Low_Beta','Mid_Beta','High_Beta'};
bands = length(band_names);

tonenum = length(twindowindexbp);

for i = 1:tonenum
    
    beginbp = twindowindexbp(i,1);
    endbp = twindowindexbp(i,2);
    binstart = beginbp:1000:(endbp - 1000);
    binend = (beginbp + 999):1000:endbp;
    binbp = cat(2,binstart',binend');
    tone = repelem(i,length(binbp));

    begincoh = twindowindexcoh(i,1);
    endcoh = twindowindexcoh(i,2);
    binstart = begincoh:20:(endcoh - 20);
    binend = (begincoh + 19):20:endcoh;
    bincoh = cat(2,binstart',binend');

    meansILBLA = zeros(length(binbp),bands);
    meansPLBLA = zeros(length(binbp),bands);
    meansILPL = zeros(length(binbp),bands);
    meansILpow = zeros(length(binbp),bands);
    meansPLpow = zeros(length(binbp),bands);
    meansBLApow = zeros(length(binbp),bands);

    minsILBLA = zeros(length(binbp),bands);
    minsPLBLA = zeros(length(binbp),bands);
    minsILPL = zeros(length(binbp),bands);
    minsILpow = zeros(length(binbp),bands);
    minsPLpow = zeros(length(binbp),bands);
    minsBLApow = zeros(length(binbp),bands);

    maxesILBLA = zeros(length(binbp),bands);
    maxesPLBLA = zeros(length(binbp),bands);
    maxesILPL = zeros(length(binbp),bands);
    maxesILpow = zeros(length(binbp),bands);
    maxesPLpow = zeros(length(binbp),bands);
    maxesBLApow = zeros(length(binbp),bands);
    
    bin = zeros(length(binbp),1);
    for j = 1:length(binbp)
        %Calculate Summary stats and build matrix
        bin(j,1) = j;
        for k = 1:length(band_groups)
            %means
            meansILBLA(j,k) = mean(ILBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");
            meansPLBLA(j,k) = mean(PLBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");
            meansILPL(j,k) = mean(ILPL(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");
            meansILpow(j,k) = mean(ILpow(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");
            meansPLpow(j,k) = mean(PLpow(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");
            meansBLApow(j,k) = mean(BLApow(band_groups{k},bincoh(j,1):bincoh(j,2)),"all");

            %mins
            minsILBLA(j,k) = min(ILBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            minsPLBLA(j,k) = min(PLBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            minsILPL(j,k) = min(ILPL(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            minsILpow(j,k) = min(ILpow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            minsPLpow(j,k) = min(PLpow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            minsBLApow(j,k) = min(BLApow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");

            %maxes
            maxesILBLA(j,k) = max(ILBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            maxesPLBLA(j,k) = max(PLBLA(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            maxesILPL(j,k) = max(ILPL(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            maxesILpow(j,k) = max(ILpow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            maxesPLpow(j,k) = max(PLpow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
            maxesBLApow(j,k) = max(BLApow(band_groups{k},bincoh(j,1):bincoh(j,2)),[],"all");
        end


    end
    if i == 1
        bins = bin;
    else
        bins = cat(1,bins,bin);
    end    
    %This is the brain information for a single tone
    %Todo: Complete loop so that all tones create one complete table
    %Label columns
    %Add column for Bin,Tone,Day,Rat
    %Once full data frame works, start adding more summary stats
    out = cat(2,meansILPL,meansPLBLA,meansILBLA,meansILpow,meansPLpow,meansBLApow,...
        minsILPL,minsPLBLA,minsILBLA,minsILpow,minsPLpow,minsBLApow,...
        maxesILPL,maxesPLBLA,maxesILBLA,maxesILpow,maxesPLpow,maxesBLApow);
    if i == 1
        DayData = out;
    else
        DayData = cat(1,DayData,out);
    end  
     if i == 1
        tones = tone;
    else
        tones = cat(2,tones,tone);
    end 
end    

%means
ILPLlabel_mean = arrayfun(@(i) ['ILPL_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
ILBLAlabel_mean = arrayfun(@(i) ['ILBLA_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLBLAlabel_mean = arrayfun(@(i) ['PLBLA_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

ILpowlabel_mean = arrayfun(@(i) ['IL_pow_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLpowlabel_mean = arrayfun(@(i) ['PL_pow_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
BLApowlabel_mean = arrayfun(@(i) ['BLA_pow_mean_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

%mins
ILPLlabel_min = arrayfun(@(i) ['ILPL_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
ILBLAlabel_min = arrayfun(@(i) ['ILBLA_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLBLAlabel_min = arrayfun(@(i) ['PLBLA_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

ILpowlabel_min = arrayfun(@(i) ['IL_pow_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLpowlabel_min = arrayfun(@(i) ['PL_pow_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
BLApowlabel_min = arrayfun(@(i) ['BLA_pow_min_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

%maxes
ILPLlabel_max = arrayfun(@(i) ['ILPL_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
ILBLAlabel_max = arrayfun(@(i) ['ILBLA_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLBLAlabel_max = arrayfun(@(i) ['PLBLA_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

ILpowlabel_max = arrayfun(@(i) ['IL_pow_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
PLpowlabel_max = arrayfun(@(i) ['PL_pow_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);
BLApowlabel_max = arrayfun(@(i) ['BLA_pow_max_' band_names{i}], ...
    (1:6)', 'UniformOutput', false);

labels = cat(1,"Day", "Tone","Bin",ILPLlabel_mean,PLBLAlabel_mean,ILBLAlabel_mean,ILpowlabel_mean,PLpowlabel_mean,BLApowlabel_mean,...
    ILPLlabel_min,PLBLAlabel_min,ILBLAlabel_min,ILpowlabel_min,PLpowlabel_min,BLApowlabel_min,...
    ILPLlabel_max,PLBLAlabel_max,ILBLAlabel_max,ILpowlabel_max,PLpowlabel_max,BLApowlabel_max);

day = repelem(daynum,length(DayData));

DayData = cat(2,day',tones',bins,DayData);

out = array2table(DayData,'VariableNames',labels');

% if daynum == 1
%    animaltable = out;
% else
%    animaltable = cat(1,animaltable,out)
% end
%end % Day loop 
%% Write

writetable(out,filename) 
