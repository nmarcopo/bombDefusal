function [WiresSolution, dt] = WiresSolutionFindTdelay(Bomb)
%% Wire rules

% dt is used to symbolize a time delay for following the rulebook. This
% will be a counter added every time the computer checks something.

% Make sure to put brackets in the code for BombSolution [____, ____] to receive both the
% WiresSolution and dt

% "N" represents the coefficient that is multiplied to the dt value in
% order to more adequately simulate how much time it takes to follow one
% decision

dt=0;
N=2;
% Placeholder for number of wires
WireNum = Bomb.hideWire;

% Placeholder for order of wires
WireOrder = Bomb.Wires;

% For the solution matrix, a 1 means the wire is cut while a 0 means the
% wire is uncut

% 1 = red, 2 = blue, 3 = yellow, 4 = green, 5 = orange
switch WireNum

%% Four wire object

    case 1
        
        Solution = zeros(1,4);
        
        %% Red wire in first position dont cut
        if WireOrder(1) == 1
            dt=dt+1;
            Solution(1) = 0;
            
            % Blue wire is seecond wire cut it
            if WireOrder(2) == 2
                dt=dt+1;
                Solution(2) = 1;
            else
                dt=dt+1;
                Solution(2) = 0;
            end
            % Yellow wire is third wire cut it
            if WireOrder(3) == 3
                dt=dt+1;
                Solution(3) = 1;
            else
                dt=dt+1;
                Solution(3) = 0;
            end
            % Green wire is fourth wire cut it
            if WireOrder(4) == 4
                dt=dt+1;
                Solution(4) = 1;
            else
                dt=dt+1;
                Solution(4) = 0;
            end
            
        %% Red wire in second position cut it
        elseif WireOrder(2) == 1
            dt=dt+1;
            Solution(2) = 1;
            
            % First wire is blue cut all except blue
            if WireOrder(1) == 2
                dt=dt+1;
                
                Solution(1) = 0;
                
                Solution(3) = 1;
                
                Solution(4) = 1;
                
            % First wire is yellow cut blue wire
            elseif WireOrder(1) == 3
                dt=dt+1;
                % if third wire is clue
                if WireOrder(3) == 2
                    dt=dt+1;
                    
                    Solution(1) = 0;
                    
                    Solution(3) = 1;
                    
                    Solution(4) = 0;
                    
                    % if fourth wire is blue
                elseif WireOrder(4) == 2
                    dt=dt+1;
                    Solution(1) = 0;
                    
                    Solution(4) = 1;
                    
                    Solution(3) = 0;
                end
                
            % First wire is green dont cut any other wires
            elseif WireOrder(1) == 4
                dt=dt+1;
                WireOrder(1) = 0;
                
                WireOrder(3) = 0;
                
                WireOrder(4) = 0;
                
            end
            
        
        %% Red wire is in third position do not cut
        elseif WireOrder(3) == 1
            dt=dt+1;
            Solution(3) = 0;
            
            % Fourth wire is NOT blue cut it, don't cut other wires 
            if WireOrder(4) ~= 2
                dt=dt+1;
                Solution(1) = 0;
                
                Solution(2) = 0;
                
                Solution(4) = 1;
                % Fourth wire is blue, don't cut but cut first and second
                % wires
            elseif WireOrder(4) == 2
                dt=dt+1;
                Solution(1) = 1;
                
                Solution(2) = 1;
                
                Solution(4) = 0;
            end
            %% Red wire is in fourth position look at first wire
        elseif WireOrder(4) == 1
            dt=dt+1;
            % first wire is blue
            if WireOrder(1) == 2
                dt=dt+1;
               % cut red wire
               Solution(4) = 1;
             
                % if second wire is yellow cut blue wire (1st wire)
                if WireOrder(2) == 3
                   dt=dt+1;
                    Solution(1) = 1;
                else
                    dt=dt+1;
                    Solution(1) = 0;

                end
                
                % Second and Third wire is safe
                Solution(2) = 0;
                
                Solution(3) = 0;
                
            % If first wire is yellow
            elseif WireOrder(1) == 3
                dt=dt+1;
                % Red wire is uncut
                Solution(4) = 0;
                
                % If second wire is green, cut the green and yellow wires
                if WireOrder(2) == 4
                   dt=dt+1;
                    Solution(1) = 1;
                    
                    Solution(2) = 1;
                    
                else
                    dt=dt+1;
                    Solution(1) = 0;
                    
                    Solution(2) = 0;
                    
                end
                
                % Third wire(blue) is uncut
                Solution(3) = 0;
                
                
            % if first wire is green
            elseif WireOrder(1) == 4
                dt=dt+1;
                    % And second wire is blue, cut all four wires
                if WireOrder(2) == 2
                    dt=dt+1;
                    
                    Solution(1) = 1;
                    Solution(2) = 1;
                    Solution(3) = 1;
                    Solution(4) = 1;
                % And second wire is yellow, cut no wires
                elseif WireOrder(2) == 3
                    dt=dt+1;
                    
                    Solution(1) = 0;
                    Solution(2) = 0;
                    Solution(3) = 0;
                    Solution(4) = 0;
                end
                
                
                
            end
            
            
            
            
        end



%% Five wire object

    case 0
        
        
    % If orange wire is in the first position, cut the orange wire
    if WireOrder(1) == 5
        dt=dt+1;
        %cut the orange wire
        Solution(1) = 1;
        
        % If yellow is the second wire, cut the yellow wire
        if WireOrder(2) == 3
            dt=dt+1;
            Solution(2) = 1;
        else
            dt=dt+1;
            Solution(2) = 0;
        end
        
        % If the green wire is in the third position, cut the green wire
        
        if WireOrder(3) == 4
            dt=dt+1;
            Solution(3) = 1;
            
        else
            dt=dt+1;
            Solution(3) = 0;
        end
        
        % If the blue wire is fourth, cut theblue wire
        if WireOrder(4) == 2
            dt=dt+1;
            Solution(4) = 1;
            
        else
            dt=dt+1;
            Solution(4) = 0;
        end
        
        % if the red wire is fifth, cut the red wire
        
        if WireOrder(5) == 1
            dt=dt+1;
            Solution(5) = 1;
            
        else
            dt=dt+1;
            Solution(5) = 0;
        end
        
    % If the orange wire is second, cut orange and look for position of the
    % red wire
    elseif WireOrder(2) == 5
        dt=dt+1;
        Solution(2) = 1;
        
        % Look for position of the red wire
        
        % If red is first, cut all the wires
        if WireOrder(1) == 1
            dt=dt+1;
            
            Solution(1) = 1;
            Solution(3) = 1;
            Solution(4) = 1;
            Solution(5) = 1;
        end
        
        %If red wire is third, check first wire
        if WireOrder(3) == 1
            dt=dt+1;
            
            % if first wire is blue, cut all wires
            if WireOrder(1) == 2
                dt=dt+1;
                
            Solution(1) = 1;
            Solution(3) = 1;
            Solution(4) = 1;
            Solution(5) = 1;
        
            end
            
            % if first wire is green, cut no wires
            if WireOrder(1) == 4
                dt=dt+1;
                
                Solution(1) = 0;
                Solution(3) = 0;
                Solution(4) = 0;
                Solution(5) = 0;
            end
            
            % if first wire is yellow, cut yello wire
            if WireOrder(1) == 3
                dt=dt+1;
                
                Solution(1) = 1;
                Solution(3) = 0;
                Solution(4) = 0;
                Solution(5) = 0;
            end
        end
        
        % if red wire is fourth, cut the red wire
        if WireOrder(4) == 1
            dt=dt+1;
            
            Solution(4) = 1;
            
            Solution(1) = 0;
            
            Solution(3) = 0;
            
            Solution(5) = 0;
        end
        
        % if the red wire is the fifth wire, do not cut any more wires
        if WireOrder(5) == 1
            dt=dt+1;
            
            Solution(1) = 0;
            Solution(3) = 0;
            Solution(4) = 0;
            Solution(5) = 0;
        end
        
        
        
        % if the orange wire is third, do not cut the orange wire
        
    elseif WireOrder(3) == 5
            dt=dt+1;
            
            Solution(3) = 0;
            
            % if blue wire is first, cut all but blue and orange
            if WireOrder(1) == 2
                dt=dt+1;
                
                Solution(1) = 0;
                
                Solution(2) = 1;
                
                Solution(4) = 1;
                
                Solution(5) = 1;
        
            end
            
            % if the blue wire is seonc, cut the blue wire
            
            if WireOrder(2) == 2
                dt=dt+1;
                
                Solution(2) = 1;
                
                Solution(1) = 0;
                
                Solution(4) = 0;
                
                Solution(5) = 0;
            end
            
            % if the blue wire is in the fourth position, no cutting!
            
            if WireOrder(4) == 2
                dt=dt+1;
                
                Solution(1) = 0;
                
                Solution(2) = 0;
                
                Solution(4) = 0;
                
                Solution(5) = 0;
            end
            
            % if the blue wire is fifth, look at the other wires
            
            if WireOrder(5) == 2
                dt=dt+1;
                
                % if red is first, cut red
                if WireOrder(1) == 1
                    dt=dt+1;
                    Solution(1) = 1;
                else
                    dt=dt+1;
                    Solution(1) = 0;
                end
                
                % if green is second, cut green
                
                if WireOrder(2) == 4
                    dt=dt+1;
                    Solution(2) = 1;
                else
                    dt=dt+1;
                    Solution(2) = 0;
                end
                
                % if yellow is fourth, cut yellow
                
                if WireOrder(4) == 3
                    dt=dt+1;
                    Solution(4) = 1;
                else
                    dt=dt+1;
                    Solution(4) = 0;
                end
            end
        
        
        
        % if the orange wire is fourth, look at the second wire
       elseif WireOrder(4) == 5
            dt=dt+1;
            % if second is red, cut them all
            if WireOrder(2) == 1
                dt=dt+1;
                Solution = ones(1, 5);
                
            end
            
            % if second is blue, look at third wire
            if WireOrder(2) == 2
                dt=dt+1;
                % if third wire is red, cut red
                if WireOrder(3) == 1
                    dt=dt+1;
                    
                    Solution(3) = 1;
                    
                    Solution(1) = 0;
                    
                    Solution(2) = 0;
                    
                    Solution(4) = 0;
                    
                    Solution(5) = 0;
                end
                
                % if the third wire is green, cut the blue wire
                
                if WireOrder(3) == 4
                    dt=dt+1;
                    for it = 1:5

                        if WireOrder(it) == 2
                            
                            
                            Solution(it) = 1;
                            
                        else
                            Solution(it) = 0;
                            
                        end
                        
                    end
                end
                
                % if the third wire is yellow, cut the red wire
                
                if WireOrder(3) == 3
                    dt=dt+1;
                    for it = 1:5
                        
                        if WireOrder(it) == 1
                            
                            Solution(it) = 1;
                            
                        else
                            Solution(it) = 0;
                        end
                        
                    end
                    
                end
                
            end
            
            % if the second wire is green, cut no wires
            
            if WireOrder(2) == 4
                dt=dt+1;
                
                Solution = zeros(1,5);
               
            end
                        
            % if the second wire is yellow, cut the red and blue wires
            
            if WireOrder(2) == 3
                dt=dt+1;
                
                if WireOrder(1) == 1 || WireOrder(1) == 2
                    
                    Solution(1) = 1;
                    
                else
                    
                    Solution(1) = 0;
                end
                
                if WireOrder(3) == 1 || WireOrder(3) == 2
                  
                    
                    Solution(3) = 1;
                    
                else
                    
                    Solution(3) = 0;
                end
                
                if WireOrder(5) == 1 || WireOrder(5) == 2
                    
                    Solution(5) = 1;
                    
                else
                    Solution(3) = 0;
                end
                
            end
        
    % If the orange wire is fifth, cut the orange wire
    elseif WireOrder(5) == 5
        dt=dt+1;
        Solution(5) = 1;
        
        % if red is first, cut the red wire
        if WireOrder(1) == 1
            dt=dt+1;
            Solution(1) = 1;
            
        end
        
        % if second is blue, cut clue
        
        if WireOrder(2) == 2
            dt=dt+1;
            Solution(2) = 1;
            
        end
        
        % if third wire is green, cut green
        
        if WireOrder(3) == 4
            dt=dt+1;
            Solution(3) = 1;
            
        end
        
        % if fourth is yellow, cut yellow
        if WireOrder(4) == 3
            dt=dt+1;
            Solution(4) = 1;
            
        end
        
        if Solution == ones(1,5)
            dt=dt+1;
            Solution = zeros(1,5);
            
        end
        
    end

        
end


WiresSolution = Solution;
dt=dt*N;
