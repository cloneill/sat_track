%arcos function

function arccos = arccos(arg)

format long

    if (abs(arg) <= 1)
        arccos=acos(arg);
    elseif (arg <= -1)
        arccos=pi;
    else
        arccos=0;
    end
    return;
end