%Function to find the current satellite look-angles at the station position.
%Equation and formulae found on pg. 34-35 of the software specifications 

function lookParam = TOPO2look(topoPosition, topoVelocity)

format long;

%calculate azimuth angle (in radians)

lookParam(1) = atan(topoPosition(1)/topoPosition(2));

%calculate elevation angle

lookParam(2) = atan(topoPosition(3)/sqrt((topoPosition(1))^2+(topoPosition(2))^2));

%define partial topocentric position matrix (x and y values)

partialPos = [topoPosition(1); topoPosition(2); 0];

%define partial topocentric velocity matrix (x and y values)

partialVel = [topoVelocity(1); topoVelocity(2); 0];

%calculate the azimuth rate

lookParam(3) = norm((1/(norm(partialPos))^2)*(cross(partialVel, partialPos))); 

%calculate the elevation rate

lookParam(4) = (1/(norm(topoPosition))^2)*(norm(partialPos)*topoVelocity(3)...
                - (topoPosition(3)/norm(partialPos))*(dot(partialPos, partialVel)));

lookParam = lookParam';
            
return;

%test values:

%topoPosition = 1.0e+04*[2.360912879343346; 0.437730071004553; 0.512632456965022];
%topoVelocity = 1.0e+04*[-0.000113783754465; 0.000254658594158; 0.000129696903734];

end