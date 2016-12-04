%Function to find the current satellite position and velocity in ECF
%coordinates.
%Equations and formulae found on pg. 30 of software specifications

%thetaT assumed to be in radians!! sasha leaves it in julian days for some
%reason

function ecfPosVel = satECF(thetaT, eciPosition, eciVelocity)

    format long;
    
    %Convert thetaT which sasha in his code gives in julian days (don't know why he does that but ok..)
    
    newTheta = thetaj(thetaT);
    
    %define constants
    
    thetaTd = 2*pi/86164.091; %constant sidereal rotation of Earth
    
    %transformation matrix from ECI frame to ECF frame
    
    ECI2ECf = [cos(newTheta) sin(newTheta) 0; -sin(newTheta) cos(newTheta) 0; 0 0 1]; 
    
    
    %calculate the position in ECF frame
    %newTheta is Greenwich Mean Sidereal Time (GMST)
    
    ecfPosVel(1,:) = ECI2ECf*eciPosition;
    
    %calculate the velocity if ECF frame
    
    ecfPosVel(2,:) = (ECI2ECf*eciVelocity)-(-thetaTd)*[-sin(newTheta) cos(newTheta) 0; -cos(newTheta) -sin(newTheta) 0; 0 0 0]*eciPosition;
    
    ecfPosVel = ecfPosVel';
    
    %test values: (2453484.75581019, [13743.9019683046626596; -19801.8041632607892097; 11289.9733391396821389],
    %               1.260648247115945; 2.4595332077529415; 2.7026908311933608)
    return;
end