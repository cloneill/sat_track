%This function reduces angles greater than two pi by subtracting 2p
%from the angle

function reduce = fixang(ang_in)
    
    format long;
    
    reduce=mod(ang_in, 2*pi);
    return;
end