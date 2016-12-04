%obtains the fractional part of the input argument

function fraction = frac(arg)

    format long
    fraction=mod(arg, floor(arg));
    return;
end