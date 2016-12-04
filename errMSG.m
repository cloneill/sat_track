%"beeps" the terminal, displays an error message STRING and exits.

function error = errMSG(string)
    
    format long;
    
    beep;
    error = string;
    return;
end