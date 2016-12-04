%Function to find the current station position in ECF coordinates.
%Equations and formulae are given pn pg. 32 of the software specifications

%latitude and longitude in degrees, using sind/cosd functions!

function [station_ecf_position] = stationECF(statLongitude, statLatitude, statElevation)
    
    format long;
    
    %Define constants
    
    earthRadius = 6378137; %Earth reference ellipsoid equatorial radius (The World Geodetic System 1984,WGS84)
    flattening = 1/298.257223563; %Reference ellipsoid flattening
    ellipsoidEcc = sqrt(2*flattening-flattening^2); %ellipsoidal eccentricity
    
    %Calculate the Earth ellipsoid radius of curvature of the meridian
    
    N = earthRadius/(sqrt(1-ellipsoidEcc^2*(sind(statLatitude))^2));
    
    %Calculate the ECF Cartesian coordinated of the tracking station
    
    station_ecf_position = [(N+statElevation)*cosd(statLatitude)*cosd(statLongitude); 
                            (N+statElevation)*cosd(statLatitude)*sind(statLongitude); 
                            ((1-ellipsoidEcc^2)*N+statElevation)*sind(statLatitude)]*1e-3; %divide by 1000 to get into km
    return;
    
    %test values: (281.926959722222, 45.9555033333333, 260.42000)
    
end
