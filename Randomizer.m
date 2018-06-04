function [elapsedtime, totalattempts, simulatedtime, timeperpanel] = Randomizer(Solution,dt)
timer = cputime;
nWires = length(Solution.Wires);

% Randomize to find solution for wires
attempt = 1;
if nWires == 4
    
    solved = false;
    attempt = 1;
    
    while solved == false
        checked = false;
        while checked == false
            repeat = 0;
            a = randi([0,1]);
            b = randi([0,1]);
            c = randi([0,1]);
            d = randi([0,1]);
            
            x(attempt,1:nWires) = [a, b, c, d];
            for j = 1:attempt-1
                % checks if there are any repeats in the x array
                if x(attempt,1:nWires) == x(j,1:nWires)
                    repeat = repeat +1;
                end
            end
            if repeat == 0
                checked = true;
            end
            
        end
        if x(attempt,1:nWires) == Solution.Wires
            solved = true;
            randWireSol = x(attempt,1:nWires);
        end
        attempt = attempt+1;
    end
end
totalattempts = attempt;


if nWires == 5
    
    solved = false;
    attempt = 1;
    
    while solved == false
        checked = false;
        while checked == false
            repeat = 0;
            a = randi([0,1]);
            b = randi([0,1]);
            c = randi([0,1]);
            d = randi([0,1]);
            e = randi([0,1]);
            
            x(attempt,1:nWires) = [a, b, c, d, e];
            for j = 1:attempt-1
                % checks if there are any repeats in the x array
                if x(attempt,1:nWires) == x(j,1:nWires)
                    repeat = repeat +1;
                end
            end
            if repeat == 0
                checked = true;
            end
            
        end
        if x(attempt,1:nWires) == Solution.Wires
            solved = true;
            randWireSol = x(attempt,1:nWires);
        end
        attempt = attempt+1;
    end
end
totalattempts = totalattempts + attempt;
sectionattempt(1) = attempt;
clear x

% Randomize to find solution for switches

solved = false;
attempt = 1;

while solved == false
    checked = false;
    while checked == false
        repeat = 0;
        a = randi([0,1]);
        b = randi([0,1]);
        c = randi([0,1]);
        d = randi([0,1]);
        
        x(attempt,1:4) = [a, b, c, d];
        for j = 1:attempt-1
            % checks if there are any repeats in the x array
            if x(attempt,1:4) == x(j,1:4)
                repeat = repeat +1;
            end
        end
        if repeat == 0
            checked = true;
        end
        
    end
    if x(attempt,1:4) == Solution.Switches
        solved = true;
        randSwitchSol = x(attempt,1:4);
    end
    attempt = attempt+1;
end
totalattempts = totalattempts + attempt;
sectionattempt(2) = attempt;
clear x

% Randomize Buttons

attempt = 1;
solved = false;
x = 1;

while solved == false
    if Solution.Buttons(attempt) == x
        solved = true;
        randButSol = [zeros([1,attempt-1]), x, zeros([1,4-attempt])];
    end
    attempt = attempt + 1;
end
totalattempts = totalattempts + attempt;
sectionattempt(3) = attempt;
clear x

% Randomize Numpad

nWires = length(Solution.Wires);
numSolution = num2str(Solution.Numpad);

if nWires == 4
    for i = 1:3
        solved = false;
        attempt = 0;
        while solved == false
            attempt = attempt + 1;
            checked = false;
            while checked == false
                repeat = 0;
                for j = 1:3
                    x(attempt,j) = randi([0,9]);
                end
                for j = 1:attempt-1
                    % checks if there are any repeats in the x array
                    if x(attempt,1:3) == x(j,1:3)
                        repeat = repeat + 1;
                        break
                    end
                end
                if repeat == 0
                    checked = true;
                end
            end
            
            tried = x(attempt,1)*100 + x(attempt,2)*10 + x(attempt,3);
            tried = num2str(tried);
            
            if strcmp(tried,numSolution(1:3)) & i == 1
                randNumSol(1,1:3) = x(attempt,1:3);
                solved = true;
                clear x
            elseif strcmp(tried,numSolution(4:6)) & i == 2
                randNumSol(1,4:6) = x(attempt,1:3);
                solved = true;
                clear x
            elseif strcmp(tried,numSolution(7:9)) & i == 3
                randNumSol(1,7:9) = x(attempt,1:3);
                solved = true;
            end
        end
        totalattempts = totalattempts + attempt;
    end
end

if nWires == 5
    for i = 1:4
        solved = false;
        attempt = 0;
        while solved == false
            attempt = attempt + 1;
            checked = false;
            while checked == false
                repeat = 0;
                for j = 1:3
                    x(attempt,j) = randi([0,9]);
                end
                for j = 1:attempt-1
                    % checks if there are any repeats in the x array
                    if x(attempt,1:3) == x(j,1:3)
                        repeat = repeat + 1;
                        break
                    end
                end
                if repeat == 0
                    checked = true;
                end
            end
            
            tried = x(attempt,1)*100 + x(attempt,2)*10 + x(attempt,3);
            tried = num2str(tried);
            
            if strcmp(tried,numSolution(1:3)) & i == 1
                randNumSol(1,1:3) = x(attempt,1:3);
                solved = true;
                clear x
            elseif strcmp(tried,numSolution(4:6)) & i == 2
                randNumSol(1,4:6) = x(attempt,1:3);
                solved = true;
                clear x
            elseif strcmp(tried,numSolution(7:9)) & i == 3
                randNumSol(1,7:9) = x(attempt,1:3);
                solved = true;
                clear x
            elseif strcmp(tried,numSolution(10)) & i == 4
                randNumSol(1,10:12) = x(attempt,1:3);
                solved = true;
            end
        end
        totalattempts = totalattempts + attempt;
    end
end
sectionattempt(4) = attempt;

timeperpanel = sectionattempt .* dt;
elapsedtime = cputime - timer;
simulatedtime = totalattempts * dt;