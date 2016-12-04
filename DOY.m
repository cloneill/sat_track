%The function DOY calculates the day of the year for the specified date.

function dayNumber=DOY(year, month, day)
    
    if (mod(year, 4)~=0 || (mod(year, 4) ==0 && mod(year,100)==0 && mod(year,400) ~=0))
        daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    else 
        daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    end
    
    i=1;
    dayNumber=0;
    
    while (i < month)
    dayNumber=dayNumber+daysInMonth(i);
    i=i+1;
    end
    
    dayNumber = dayNumber + day;
    return;
end