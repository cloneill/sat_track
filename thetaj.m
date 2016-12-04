%The function THETAJ returns the Greenwich Mean Sidereal Time in radians
%for an epoch specified by Julian day JD.

function gmstRAD = thetaj(JulianDate)

    format long;
    
    % http://celestrak.com/columns/v02n02/
    JCENTRIES = 36525;
    JD2000 = dat2JD('2000-01-01 12:00:00');
    UT = frac(JulianDate + 0.5);
    JD = JulianDate - UT;
    T = (JD - JD2000)/JCENTRIES;
    GMST = 24110.54841 + T * (8640184.812866 + T * (0.093104 - T * 6.2E-6));
    GMST = mod(GMST + 86400.0*1.00273790934*UT,86400.0);
    
    gmstRAD = 2*pi * GMST/86400;
    return;
end
