%This function reads 3 lines (the last two are in TLE format) and determines orbital
%variables for the satellite.

function readNoradTLE(line0, line1, line2)
    
    format long;
    
    %Extracting parameters according to format given in software
    %specification (pg.8-12)
    
    name = line0;
    refepoch = line1(19:20);
    inclination = line2(9:16);
    raan = line2(18:25);
    eccentricity = line2(27:33);
    perigee = line2(35:42);
    meanan = line2(44:51);
    meanmo = line2(53:63); 
    ndot = line1(34:43);
    nddot = line1(45:52);
    bstar = line1(54:61);
    orbitnum = line2(64:68);
    
    %Formatting and printing the parameter name and the value
    
    disp(sprintf('Satellite.name = %s', name));
    disp(sprintf('Satellite.refepoch = %s', refepoch));
    disp(sprintf('Satellite.incl = %s', inclination));
    disp(sprintf('Satellite.raan = %s', raan));
    disp(sprintf('Satellite.eccn = %s', eccentricity)); 
    disp(sprintf('Satellite.argper = %s', perigee));
    disp(sprintf('Satellite.meanan = %s', meanan));
    disp(sprintf('Satellite.meanmo = %s', meanmo));
    disp(sprintf('Satellite.ndot = %s', ndot));
    disp(sprintf('Satellite.nddot = %s', nddot));
    disp(sprintf('Satellite.bstar = %s', bstar));
    disp(sprintf('Satellite.orbitnum = %s', orbitnum));
        
    return;
end
