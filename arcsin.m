%arcsin function

function arcsin = arcsin(arg)

format long

    if (abs(arg) <= 1)
        arcsin=asin(arg);
    elseif (arg < -1)
        arcsin=-pi/2;
    else
        arcsin=pi/2;
    end
    return;
end