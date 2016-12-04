%calculates the angle in between two vectors

function angle = angle(vector1, vector2)
    
    format long;

    dotp = dot(vector1, vector2);
    v1_mag=norm(vector1);
    v2_mag=norm(vector2);
    angle = arccos(dotp/(v1_mag*v2_mag));
    return;
end