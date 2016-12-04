%The function converts a Julian Day to text string CDATE - UTC standard calendar date
%and time in format: 1997-02-24 19:11:00

function dateString = jd2DAT(julianDate)
    
    format long;
    
    hour = (mod(julianDate, floor(julianDate))+0.5)*24; %need to add 0.5 since a full day goes to noon (i.e. there will be a 0.5 fractional part for a full day even though h:m:s=00:00:00)
    minute = mod(hour, floor(hour))*60;
    second = floor(mod(minute, floor(minute))*60);    %floor to get rid of fractional part
    hour=floor(hour);   %there are round-off errors, off by 1 sec in the case h:m:00
    minute=floor(minute); 
    
    %The following code for changing julian day to gregorian calendar day
    %is found from wikipedia:
    %http://en.wikipedia.org/wiki/Julian_day#Gregorian_calendar_from_Julian_day_number
    
    J=julianDate + 0.5; 
    j=J+32044; 
    g=floor(j/146097);
    dg=mod(j,146097); 
    c= floor((floor(dg/36524)+1)*3/4);
    dc=dg-(c*36524); 
    b= floor(dc/1461);
    db=mod(dc,1461); 
    a=floor((floor(db/365)+1)*3/4);
    da=db-(a*365); 
    y=g*400+c*100+b*4+a; 
    m=floor((da*5+308)/153)-2; 
    d=da - floor((m+4)*153/5) +122;
    year=y-4800+floor((m+2)/12);
    month=mod((m+2),12)+1;
    day=floor(d+1);
    
    %convert integer values to strings
    
    stringYear=num2str(year);
    stringMonth=num2str(month);
    stringDay=num2str(day);
    stringHour=num2str(hour);
    stringMinute=num2str(minute);
    stringSecond=num2str(second);
    
    %make variables for special characters for concatenation
    dash='-';
    space=' ';
    colon=':';
    
    %Concatenate to get into correct form (use horzcat to preserve spaces) 
    dateString=horzcat(stringYear,dash,stringMonth,dash,stringDay,space,stringHour,colon,stringMinute,colon,stringSecond);
    return;
end
