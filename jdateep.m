%The function Julian DAte of EPoch returns the Julian Date of an epoch specified in the
%format used in the NORAD two-line element sets

function jEpoch = jdateep(epoch)
    
    format long;
    
    year = floor((epoch/1000))+2000; %extracting the year from the input (add 2000 since only last two digits are given and range is 2000-2056)
    day = rem(epoch, 1000); %extracting the day from the input (includes fractional days)
    jEpoch = jdaty(year)+day; %using previous function and adding days and fractional days since zeroeth day of the input year                                               
    return;
end