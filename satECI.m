%Function to find the current satellite position and velocity in ECI
%coordinates.
%Equations and formulae found in software specification pg. 28-29
%Note that all angles are in degrees EXCEPT the eccentric anomoly which is
%in radians

function posvel = satECI(ecc, eccAnom, semiMaj, ascending ,perigee, inc, meanMotion)

    format long;
    
    %The true anomoly and the first derivitive of the true anomoly (angles assumed to be in radians!) 
    
    tanom = 2*atand(sqrt((1+ecc)/(1-ecc))*(tan(eccAnom/2))); 
    tanomd = meanMotion*((sqrt(1-ecc^2))/(1-(ecc*cos(eccAnom)))^2); 
    
    %The spacecraft range and its first derivative
    
    range = semiMaj*(1-ecc^2)/(1+ecc*cosd(tanom)); 
    ranged = ((semiMaj*ecc*(1-ecc^2)*sind(tanom))/(1+ecc*cosd(tanom))^2)*tanomd; 
    
    %Calculate the position of the satellite in the ECI frame
    
    posvel(:, 1) = [cosd(ascending)*cosd(perigee+tanom)-sind(ascending)*cosd(inc)*sind(perigee+tanom) 0 0;
        sind(ascending)*cosd(perigee+tanom)+cosd(ascending)*cosd(inc)*sind(perigee+tanom) 0 0; 
        sind(inc)*sind(perigee+tanom) 0 0]*[range;0;0];
    
    %Calculate the velocity of the satellite in the ECI frame
    
    posvel(:,2) = [cosd(ascending)*cosd(perigee+tanom)-sind(ascending)*cosd(inc)*sind(perigee+tanom); 
        sind(ascending)*cosd(perigee+tanom)+cosd(ascending)*cosd(inc)*sind(perigee+tanom); 
        sind(inc)*sind(perigee+tanom)]*ranged...
        +[-cosd(ascending)*sind(perigee+tanom)-sind(ascending)*cosd(inc)*cosd(perigee+tanom); 
        -sind(ascending)*sind(perigee+tanom)+cosd(ascending)*cosd(inc)*cosd(perigee+tanom); 
        sind(inc)*cosd(perigee+tanom)]*range*tanomd;
    
    %test function: satECI(8.6707e-3, 4.45901506964682, 26559.3690390589,
    %285.742, 136.112, 55.1681, 1.45863348484289e-4)
    return;
end