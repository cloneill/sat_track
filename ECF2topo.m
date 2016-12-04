%Function to find the current satellite position and velocity in the topocentric system
%coordinate.
%Equations and formulae found on pg. 32 of the software specifications

%station latitude and longitude in degrees, using sind/cosd functions!!

function topoPosVel = ECF2topo(statPosition, satECFPosition, satECFVelocity, statLongitude, statLatitude)

format long;

%Define ECF to topocentric transformation matrix

T = [-sind(statLongitude) cosd(statLongitude) 0;
    -cosd(statLongitude)*sind(statLatitude) -sind(statLongitude)*sind(statLatitude) cosd(statLatitude);
    cosd(statLongitude)*cosd(statLatitude) sind(statLongitude)*cosd(statLatitude) sind(statLatitude)];

%Calculate the range vector (Not sure if this is the way to calculate this!)

range = [satECFPosition(1)-statPosition(1);
        satECFPosition(2)-statPosition(2);
        satECFPosition(3)-statPosition(3)];

%calculate satellite Topocentric position

topoPosVel(1,:) = T*range;

%calculate satellite topocentric velocity


topoPosVel(2,:) = T*satECFVelocity;

topoPosVel = topoPosVel';

return;

%test values: 

%statPosition = 1.0e+03*[0.918015987806468; -4.346161758334040; 4.561997677793263]
%satECFPosition = 1.0e+04*[2.410375042105086; 0.012451937275650; 1.128997333913968]
%satECFVelocity = 1.0e+04*[-0.000130522619395; 0.000067360951102; 0.000270269083119]
%statLongitude = 281.926959722222
%statLatitude = 45.9555033333333
%statElevation = 260.42000

end