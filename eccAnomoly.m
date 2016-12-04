%Function to resolve Kepler's equation to find eccentric anomaly

function eanom = eccAnomoly(meanAnomoly, ecc)

    format long;
    
    deltaE = 1*10^-15; %precision when to stop the approximation
        
    ecca0 = meanAnomoly;
    ecca1 =0; %prime the while loop

    while (abs(ecca1-ecca0) > deltaE) %Newton Raphson iterative method (described in software specs pg. 27)
        
        temp = ecca1;
        delanom = ecca0-ecc*sin(ecca0)-meanAnomoly;
        delecca = -delanom/(1-ecc*cos(ecca0));
        ecca1 = ecca0 + delecca;
        ecca0 = temp;
    end
    
    eanom = ecca1;
    
%     test     
%     difference = ecca1-ecc*sin(ecca1)-meanAnomoly
    
    return;
end