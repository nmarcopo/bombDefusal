function [numSolution, dt] = numpadSolutionTdelay(Solution, Bomb)
% This function tkaes the solutions from the other three modules and uses
% them to generate a code that is necessary to solve the bomb

% dt is the simulated time delay, and there is a coefficient "N" to make the dt
% longer, sufficiently so that the dt corresponds with an average amount of
% time to do the module

N=3;
dt=0;

%% Wires code

% four or five letter code for the wires solution

% determine if its a four or five digit code
NumWire = length(Solution.Wires);

% initialize the code as an array
WiresCode = zeros(1, NumWire);

% check if each wire is cut or uncut, detemine the code based on
% that
if Solution.Wires(1) == 1
    dt=dt+1;
    WiresCode(1) = 2;
    
else
    dt=dt+1;
    WiresCode(1) = 7;
end

if Solution.Wires(2) == 1
    dt=dt+1;
    WiresCode(2) = 1;
    
else
    dt=dt+1;
    WiresCode(2) = 9;
    
end

if Solution.Wires(3) == 1
    dt=dt+1;
    WiresCode(3) = 3;
    
else
    dt=dt+1;
    WiresCode(3) = 6;
    
end

if Solution.Wires(4) == 1
    dt=dt+1;
    WiresCode(4) = 5;
    
else
    dt=dt+1;
    WiresCode(4) = 2;
end


% Only run this if there are 5 wires, determines the 5th digit of the code
if NumWire == 5
    dt=dt+1;
    if Solution.Wires(5) == 1
        
        WiresCode(5) = 4;
        
    else
        WiresCode(5) = 8;
        
    end
    
end


%% Buttons code

% Only take the value of the button pressed


if Solution.Buttons(1) == 1
    dt=dt+1;
    ButtonsCode = 6;
    
elseif Solution.Buttons(2) == 1
    dt=dt+1;
    ButtonsCode = 3;
    
elseif Solution.Buttons(3) == 1
    dt=dt+1;
    ButtonsCode = 9;
    
elseif Solution.Buttons(4) == 1
    dt=dt+1;
    ButtonsCode = 2;
    
end




%% Switches Code

% Each digit determined by whether the switch is flipped up or down
% 1 = up
% 0 = down

% initialize switches code
SwitchesCode = zeros(1,4);

if Solution.Switches(1) == 1
    dt=dt+1;
    SwitchesCode(1) = 5;
    
else
    dt=dt+1;
    SwitchesCode(1) = 8;
    
end


if Solution.Switches(2) == 1
    dt=dt+1;
    SwitchesCode(2) = 7;
    
else
    dt=dt+1;
    SwitchesCode(2) = 6;
    
end


if Solution.Switches(3) == 1
    dt=dt+1;
    SwitchesCode(3) = 2;
    
else
    dt=dt+1;
    SwitchesCode(3) = 4;
    
end

if Solution.Switches(4) == 1
    dt=dt+1;
    SwitchesCode(4) = 1;
    
else
    dt=dt+1;
    SwitchesCode(4) = 3;
    
end


%% Put all the codes into one array


% the following is code that turned out to be inefficient but I haven't
% deleted yet in case I need to go back to it because the more efficient
% code is faulty:




% different statements to create the array depending on the positions of
% the modules

% first if the wires are in the first module
% if Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 2 && Bomb.Bomb.switchesPos == 3
%     
%     numSolutionArray = [WiresCode, ButtonsCode, SwitchesCode];
%     
%     
%     
% elseif Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 2 && Bomb.Bomb.switchesPos == 4
%     
%     numSolutionArray = [WiresCode, ButtonsCode, SwitchesCode];
%     
%     
% elseif Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 3 && Bomb.Bomb.switchesPos == 2
%     
%     
%     numSolutionArray = [WiresCode, SwitchesCode, ButtonsCode];
%     
%     
% elseif Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 3 && Bomb.Bomb.switchesPos == 4
%     
%     numSolutionArray = [WiresCode, ButtonsCode, SwitchesCode];
%     
%     
% elseif Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 4 && Bomb.Bomb.switchesPos == 2
%     
%     numSolutionArray = [WiresCode, SwitchesCode, ButtonsCode];
%     
% elseif Bomb.Bomb.wiresPos == 1 && Bomb.Bomb.buttonsPos == 4 && Bomb.Bomb.switchesPos == 3
%     
%     numSolutionArray = [WiresCode, SwitchesCode, ButtonsCode];
%     
%     
%     
%     % now if the buttons are the first module
% elseif Bomb.Bomb.buttonsPos == 1 &&Bomb.Bomb.wiresPos == 2 && Bomb.Bomb.switchesPos == 3
% 
%     numSolutionArray = [ButtonsCode, WiresCode, SwitchesCode];
%     
% elseif Bomb.Bomb.buttonsPos == 1 &&Bomb.Bomb.wiresPos == 2 && Bomb.Bomb.switchesPos == 4
% 
%     numSolutionArray = [ButtonsCode, WiresCode, SwitchesCode];
% 
% elseif Bomb.Bomb.buttonsPos == 1 && Bomb.Bomb.wiresPos == 3 && Bomb.Bomb.switchesPos == 4
% 
%     numSolutionArray = [ButtonsCode, WiresCode, SwitchesCode];
% 
% elseif Bomb.Bomb.buttonsPos == 1 && Bomb.Bomb.wiresPos == 3 && Bomb.Bomb.switchesPos == 2
%     
%     numSolutionArray = [ButtonsCode, SwitchesCode, WiresCode];
%     
% elseif Bomb.Bomb.buttonsPos == 1 && Bomb.Bomb.wiresPos == 4 && Bomb.Bomb.switchesPos == 2
% 
%     numSolutionArray = [ButtonsCode, SwitchesCode, WiresCode];
% 
% elseif Bomb.Bomb.buttonsPos == 1 && Bomb.Bomb.wiresPos == 4 && Bomb.Bomb.switchesPos == 3
% 
%     numSolutionArray = [ButtonsCode, SwitchesCode, WiresCode];
% 
%     
%     % now if the switches are the first module
%     
%     
% elseif Bomb.Bomb.switchesPos == 1 && Bomb.Bomb.buttonsPos == 2 && Bomb.Bomb.wiresPos == 3
%     
%     numSolutionArray = [SwitchesCode, ButtonsCode, WiresCode];
%     
% elseif Bomb.Bomb.switchesPos == 1 && Bomb.Bomb.buttonsPos == 2 && Bomb.Bomb.wiresPos == 4
%     
%     numSolutionArray = [SwitchesCode, ButtonsCode, WiresCode];
% 
% elseif Bomb.Bomb.switchesPos == 1 && Bomb.Bomb.buttonsPos == 3 && Bomb.Bomb.wiresPos == 2
%     
%     numSolutionArray = [SwitchesCode, WiresCode, ButtonsCode];
% 
% elseif Bomb.Bomb.switchesPos == 1 && Bomb.Bomb.buttonsPos == 3 && Bomb.Bomb.wiresPos == 4
% 
%     numSolutionArray = [SwitchesCode, ButtonsCode, WiresCode];
%     
%     
% end
% 


%% Real put them into array

% if wires are first

% and buttons are second

% Add 3 to dt in order to check the 3 positions to determine the order of how
% the numpad will be pressed
dt=dt+3;

if Bomb.wiresPos < Bomb.buttonsPos && Bomb.buttonsPos < Bomb.switchesPos
    
    numSolutionArray = [WiresCode, ButtonsCode, SwitchesCode];
    dt=dt+1; % Time delay to actually put in the numbers into the numpad
    % and switches are seccond
elseif Bomb.wiresPos < Bomb.switchesPos && Bomb.switchesPos < Bomb.buttonsPos
    dt=dt+1;
    numSolutionArray = [WiresCode, SwitchesCode, ButtonsCode];
    
    
% if buttons are first

% and wires are second
elseif Bomb.buttonsPos < Bomb.wiresPos && Bomb.wiresPos < Bomb.switchesPos
    dt=dt+1;
    numSolutionArray = [ButtonsCode, WiresCode, SwitchesCode];
    
    % and switches are second
elseif Bomb.buttonsPos < Bomb.switchesPos && Bomb.switchesPos < Bomb.wiresPos
    dt=dt+1;

    numSolutionArray = [ButtonsCode, SwitchesCode, WiresCode];

% if switches are first

% and wires are second
elseif Bomb.switchesPos < Bomb.wiresPos && Bomb.wiresPos < Bomb.buttonsPos
    dt=dt+1;
    numSolutionArray = [SwitchesCode, WiresCode, ButtonsCode];
    
    % if buttons are second
elseif Bomb.switchesPos < Bomb.buttonsPos && Bomb.buttonsPos < Bomb.wiresPos
    dt=dt+1;
    numSolutionArray = [SwitchesCode, ButtonsCode, WiresCode];
    
end


%% Turn the array into a single number

% This is used only to compare the number to the numpad. This does not
% deal with user input, so there is no added time delay.

% get the length of the solution array
SolLength = length(numSolutionArray);

% initialize the solution as a number
numSolution = 0;

% turn the solution array into a single number using mutliplication and
% addition
for it = 1:SolLength
    
    numSolution = numSolution + numSolutionArray(it) * 10^(SolLength - it);
    
end

dt= dt*N;
