%Station is a structure with the parameters defined below. This function reads the station
%parameters file and returns the values in degrees and meters for geographical coordinates,
%degrees for az/el limits and deg/min for maximum az/el speeds. Use for test:

function readStationFile(file)

    format long;
    
    fid = fopen(file);
    
    %Read in the content of the file as string values
    
    satParam = textscan(fid, '%s');
    
    %Assign each string in the satParam column vector to its corresponding
    %parameter
    
    name = satParam{1}{1};
    latitude = satParam{1}{2};
    longitude = satParam{1}{3};
    altitude = satParam{1}{4};
    offset = satParam{1}{5};
    limits1 = satParam{1}{6};
    limits2 = satParam{1}{7};
    azspeed = satParam{1}{8};
    elspeed = satParam{1}{9};
    
    %Display the parameters name and value with its units
    
    dispName = sprintf('Station.name = %s', name);
    disp(dispName);
    
    dispLatitude = sprintf('Station.stnlat = %s degrees', latitude);
    disp(dispLatitude);
   
    dispLongitude = sprintf('Station.stnlong = %s degrees', longitude);
    disp(dispLongitude);
    
    dispAltitude = sprintf('Station.stnalt = %s km', altitude);
    disp(dispAltitude);
    
    dispOffset = sprintf('Station.utc_offset = %s hours', offset);
    disp(dispOffset);
    
    dispLimits = sprintf('Station.az_el_lim = %s %s meters', limits1, limits2);
    disp(dispLimits);
    
    dispAzspeed = sprintf('Station.st_az_speed_max = %s deg/min', azspeed);
    disp(dispAzspeed);
    
    dispElspeed = sprintf('Station.st_el_speed_max = %s deg/min', elspeed);
    disp(dispElspeed);
    
    return;
end