%Function to calculate current mean anomaly and mean motion of the
%satellite

function mamm = meanAnomoly(time, tEpoch, iMean, n, ndot, nddot)

    format long;
    
    %define constants
    
    rad = pi/180;
    secondsInDay = 86400;
    mamm=[0 0];
    
    %Calculate the interval in Julian days (procedure can be found pg. 26 of software specs)
    
    dt = (time-tEpoch)*secondsInDay;
    
    %Convert mean anomoly to radians
    
    iMean = iMean*rad;
    
    %Convert revolutions/day to rad/s
    
    n = n*2*pi/secondsInDay;
    ndot = (ndot*2*pi)/secondsInDay^2;
    nddot = (nddot*2*pi)/secondsInDay^3;
    
    %The satellite mean anomoly at UT time t
    
    mamm(1) = iMean + n*dt + ndot*dt^2 + nddot*dt^3;
    mamm(1) = mod(mamm(1), 2*pi);
    
    %The satellite mean motion (rad/s) 
    
    mamm(2) = n + (2*ndot*dt) + 3*nddot*dt^2;
    
    %Convert the mean motion back to revolutions/day
    
    %mamm(2) = mamm(2)*secondsInDay/(2*pi)
    
    return;
end


