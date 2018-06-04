function [WireOrder, WireNum] = Wires

% Wires(handles)
% generates an array of wires in a random order, each number will
% correspond to a different color for the wires
% Currently generates either four or five different wires

clear
clc

%% Wire Array
WireNum = randi(2);
% if WireNum is generated as 1, there will be four wires, if Wirenum is
% generated as 5, there will be five wires

% initialize array for order of the wires

switch WireNum
    case 1
        
        WireOrder = zeros(1,4);
        % Choose a random number for the first wire
        WireOrder(1,1) = randi(4);
        
        % Choose a random number for the second wire
        WireOrder(1,2) = randi(4);
        
        % Check to see if the first two wires are the same number, if they are,
        % change the second wire
        while WireOrder(1,1) == WireOrder(1,2)
            
            WireOrder(1,2) = randi(4);
            
        end
        
        % Choose a random number for the third wire
        WireOrder(1,3) = randi(4);
        
        % Check to see if the third wire is the same number as either of the first
        % too
        while WireOrder(1,1) == WireOrder(1,3) || WireOrder(1,2) == WireOrder(1,3)
            
            WireOrder(1,3) = randi(4);
            
            
        end
        
        % cchoose a random number for the fourth wire
        WireOrder(1,4) = randi(4);
        
        while WireOrder(1,1) == WireOrder(1,4) || WireOrder(1,2) == WireOrder(1,4) ...
                ||  WireOrder(1,3) == WireOrder(1,4)
            
            WireOrder(1,4) = randi(4);
            
        end
        
    case 2
        WireOrder = zeros(1, 5);
        
        % Choose a random number for the first wire
        WireOrder(1,1) = randi(5);
        
        % Choose a random number for the second wire
        WireOrder(1,2) = randi(5);
        
        % Check to see if the first two wires are the same number, if they are,
        % change the second wire
        while WireOrder(1,1) == WireOrder(1,2)
            
            WireOrder(1,2) = randi(5);
            
        end
        
        % Choose a random number for the third wire
        WireOrder(1,3) = randi(5);
        
        % Check to see if the third wire is the same number as either of the first
        % too
        while WireOrder(1,1) == WireOrder(1,3) || WireOrder(1,2) == WireOrder(1,3)
            
            WireOrder(1,3) = randi(5);
            
            
        end
        
        % cchoose a random number for the fourth wire
        WireOrder(1,4) = randi(4);
        
        while WireOrder(1,1) == WireOrder(1,4) || WireOrder(1,2) == WireOrder(1,4) ...
                ||  WireOrder(1,3) == WireOrder(1,4)
            
            WireOrder(1,4) = randi(5);
            
        end
        
        WireOrder(1,5) = randi(5);
        
        while WireOrder(1,1) == WireOrder(1,5) || WireOrder(1,2) == WireOrder(1,5) ...
                ||  WireOrder(1,3) == WireOrder(1,5) || WireOrder(1,4) == WireOrder(1,5)
            
            WireOrder(1,5) = randi(5);
            
        end
        
end

%Colors

Bomb.Wires = WireOrder;


% 1 = Red, 2 = Blue, 3 = Green, 4 = Yellow, 5 = Orange