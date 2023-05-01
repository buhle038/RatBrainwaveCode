%% Load Events from Google Drive
%Loads in Data in seconds. Requires path to CSV file.
function [events] = loadEventsGoogle(path)

    l = readtable(path);
    [len,~] = size(l);
    GC = groupcounts(l,"Time");
    events = zeros(table2array(GC(GC.Var2 == "Tone_OFF","GroupCount")),1);
    j = 0;
    for i = 1:len
        if l.Var2(i) == "Tone_ON using Lafayette"
            j = j + 1;
            events(j,1) = l.Var1(i);
        end
    end
end   