function [totalattempts,simulatedtime, timeperpanel] = BruteForce(Solution,dt)

% checks to see how many wires there are
nWires=0;
numSolver=0;
nWires=length(Solution.Wires);

%% cracking Wires
complete = false;
IncrementCounter = 1;
if nWires == 4
    iCountWires = 0;
    while complete ~= true
        IncrementCounter = IncrementCounter +1;
        x = de2bi(iCountWires);
        bruteForceWires = [x zeros([1,4 - length(x)])];
        iCountWires = iCountWires + 1;
        if bruteForceWires == Solution.Wires
            complete = true;
        end
    end
end

if nWires == 5
    iCountWires = 0;
    while complete ~= true
        IncrementCounter = IncrementCounter+1;
        x = de2bi(iCountWires);
        bruteForceWires = [x zeros([1,5 - length(x)])];
        iCountWires = iCountWires + 1;
        if bruteForceWires == Solution.Wires
            complete = true;
        end
    end
end
totalattempts = IncrementCounter;
sectionattempt(1) = IncrementCounter;

%% cracking switches
complete = false;
IncrementCounter = 1;
iCountWires = 0;
while complete ~= true
    IncrementCounter = IncrementCounter +1;
    x = de2bi(iCountWires);
    bruteForceSwitches = [x zeros([1,4 - length(x)])];
    iCountWires = iCountWires + 1;
    if bruteForceSwitches == Solution.Switches
        complete = true;
    end
end
totalattempts = IncrementCounter;
sectionattempt(2) = IncrementCounter;

%% cracking buttons
numSolved=false;
IncrementCounter=1;
buttonvar = 1;

while numSolved==false
    if buttonvar == Solution.Buttons(IncrementCounter)
        numSolved=true;
    end
    IncrementCounter = IncrementCounter+1;
end
totalattempts = totalattempts + IncrementCounter;
sectionattempt(3) = IncrementCounter;

%% cracking numpad
IncrementCounter=1;

numSolved=false;

numSolver = 110;

NumpadStr = num2str(Solution.Numpad);

while numSolved~=true

    numSolver=numSolver+1;
    
    if num2str(numSolver)==NumpadStr(1:3)
    
        numSolved=true;
    end
    
    
    IncrementCounter=IncrementCounter+1;
end

totalattempts = totalattempts + IncrementCounter;

IncrementCounter=1;

numSolved=false;

numSolver = 110;

NumpadStr = num2str(Solution.Numpad);

while numSolved~=true

    numSolver=numSolver+1;
    
    if num2str(numSolver)==NumpadStr(4:6)
    
        numSolved=true;
    end
    
    IncrementCounter=IncrementCounter+1;
end

totalattempts = totalattempts+IncrementCounter;

IncrementCounter=1;

numSolved=false;

numSolver = 110;

NumpadStr = num2str(Solution.Numpad);

while numSolved~=true
    numSolver=numSolver+1;

    if num2str(numSolver)==NumpadStr(7:9)
        numSolved=true;
    
    end
    
    IncrementCounter=IncrementCounter+1;

end

numSolved=false;

numSolver = 110;

NumpadStr = num2str(Solution.Numpad);

if length(Solution.Numpad)== 10
    
    IncrementCounter=1;

    numSolved=false;
    
    numSolver=0;
    
    while numSolved~=true
    
        numSolver=numSolver+1;
        
        if num2str(numSolver)==NumpadStr(10)
        
            numSolved=true;
        end
        
        IncrementCounter=IncrementCounter+1;
    end
end

totalattempts = totalattempts+IncrementCounter;
sectionattempt(4) = IncrementCounter;

timeperpanel = sectionattempt .* dt;
simulatedtime=totalattempts*dt;
