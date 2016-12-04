%Calculate the julian date of the zeroth day of the input year

function Jdate = jdaty(year)

    format long;
    
    %forumula found from wolfram mathword
    %http://scienceworld.wolfram.com/astronomy/JulianDate.html
    
    month=1;
    day=0;
    Jdate = 367*year - floor((7/4)*(year+floor((9+month)/12)))...
        -floor((3/4)*floor(((year-((month-9)/7))/100)+1))...
        +floor(275*month/9)+day+1721028.5;
    return;
end