%The function THETAN calculates the Greenwich Mean Sidereal Time for an epoch
%specified in the format used in the NORAD two-line element sets.
%It supports dates beyond the year 1999 assuming that two-digit years
%in the range 00-56 correspond to 2000-2056. It is only valid for dates through 2056
%December 31.
%Note that this function assumes an epoch date of J2000

function GMST = thetan(epoch)

    format long;
    JDJ2000 = dat2JD('2000-01-01 12:00:00');
    
    julianDate = jdateep(epoch); %gives the julian date of the NORAD input argument
    daysSinceJ2000= julianDate - JDJ2000; %gives the amount of days since J2000(2000-01-01 12:00:00)
    
    GMST = 18.697374558 + 24.06570982441908*daysSinceJ2000; %GMST in hours
    GMST = mod(GMST, 24); %Puts GMST in 0-24hr range
    GMST = GMST*15*pi/180; %Put GMST into radians
    return;
end