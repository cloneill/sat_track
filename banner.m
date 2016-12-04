%Prints the ENG4350 team info, program name, date, version and welcome
%message.

function banner()

    format long;
    
    disp('********ENG4350 - Space Hardware********');
    disp('******Luke ONeill Tamara Tanurdzic******');
    disp('------Satellite  Tracking  Software-----');
    fprintf('         ');
    disp(curday(4));
    disp('              Version 0.1               ');
    disp('              !!WELCOME!!               ');
    
    return;
end