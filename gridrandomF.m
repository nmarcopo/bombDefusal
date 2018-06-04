function [positionarrayX, positionarrayY, wiresPos, buttonsPos, switchesPos, numpadPos, hideWire, switchesWord] = gridrandomF(WireNum)
% creates an array which can be called by projectTool which will randomize
% position of each cell in the bomb
positionarrayX=[0 0 0 0];
positionarrayY=[0 0 0 0];
possX=[9 , 63];
possY=[24 , 2];

while (positionarrayX(1)+positionarrayX(2)+positionarrayY(1)+positionarrayY(2)) == (positionarrayX(3)+positionarrayX(4)+positionarrayY(3)+positionarrayY(4)) || ...
        (positionarrayX(1)+positionarrayX(3)+positionarrayY(1)+positionarrayY(3)) == (positionarrayX(2)+positionarrayX(4)+positionarrayY(2)+positionarrayY(4)) && ...
        (positionarrayX(1)+positionarrayX(4)+positionarrayY(1)+positionarrayY(4)) == (positionarrayX(2)+positionarrayX(3)+positionarrayY(2)+positionarrayY(3))
    % Randomize X's
    x1 = possX(randi(2));
    x2 = possX(randi(2));
    
    positionarrayX(1) = x1;
    positionarrayX(2) = x2;
    if x1 == 9 && x2 == x1
        
        x3 = 63;
        x4 = 63;
    elseif x1 == 63 && x2 == x1
        x3 = 9;
        x4 = 9;
    elseif x1 ~= x2
        
        x3 = possX(randi(2));
        if x3 == 9
            x4 = 63;
            
        elseif x3==63
            x4 = 9;
        end
    end
    positionarrayX(3) = x3;
    positionarrayX(4) = x4;
    
    % randomize Ys
    y1 = possY(randi(2));
    y2 = possY(randi(2));
    
    positionarrayY(1) = y1;
    positionarrayY(2) = y2;
    if y1 == 24 && y2 == y1
        
        y3 = 2;
        y4 = 2;
    elseif y1 == 2 && y2 == y1
        y3 = 24;
        y4 = 24;
    elseif y1 ~= y2
        y3 = possY(randi(2));
        if y3 == 24
            y4 = 2;
            
        elseif y3==2
            y4 = 24;
        end
    end
    positionarrayY(3) = y3;
    positionarrayY(4) = y4;

end

% assigns a postion value to each element of our GUI
if [positionarrayX(1),positionarrayY(1)] == [9,24]
    wiresPos = 1;
    
elseif [positionarrayX(1),positionarrayY(1)] == [63,24]
    wiresPos = 2;
    
elseif [positionarrayX(1),positionarrayY(1)] == [9,2]
    wiresPos = 3;
else
    wiresPos = 4;
end

if [positionarrayX(2),positionarrayY(2)] == [9,24]
    buttonsPos = 1;
    
elseif [positionarrayX(2),positionarrayY(2)] == [63,24]
    buttonsPos = 2;
    
elseif [positionarrayX(2),positionarrayY(2)] == [9,2]
    buttonsPos = 3;
else
    buttonsPos = 4;
end

if [positionarrayX(3),positionarrayY(3)] == [9,24]
    switchesPos = 1;
    
elseif [positionarrayX(3),positionarrayY(3)] == [63,24]
    switchesPos = 2;
    
elseif [positionarrayX(3),positionarrayY(3)] == [9,2]
    switchesPos = 3;
else
    switchesPos = 4;
end

if [positionarrayX(4),positionarrayY(4)] == [9,24]
    numpadPos = 1;
    
elseif [positionarrayX(4),positionarrayY(4)] == [63,24]
    numpadPos = 2;
    
elseif [positionarrayX(4),positionarrayY(4)] == [9,2]
    numpadPos = 3;
else
    numpadPos = 4;
end

% randomize number of wires
if WireNum == 1
    hideWire = true;
    
elseif WireNum == 2
    hideWire = false;
    
end

% randomize switch word
wordlist = {'spurn','badge','tribe','rheum';...
	'patient','key','ducats','Jewish';...
	'run','turn','churn','scribe';...
	'describe','gun','shun','pun';...
	'overflow','shekel','tea','grate'};
% first two rows are words in Shakespeare's passage in Merchant of Venice
selectwordrow = randi(5);   	% the row of the selected word
switchesWord = wordlist(selectwordrow,randi(4));
                            	% the selected row is in the wordlist row
                            	% of the selected row, and then a random
                            	% column for the selected word
% The next 20 if statements seem redundant, but because selecting a word
% from the cell array wordlist did not allow "selectedword(2)" or whatever,
% the program needs to change selectedword from a cell to just a single
% string
if strcmp(switchesWord,'spurn')
	switchesWord = 'spurn';
end
if strcmp(switchesWord,'badge')
	switchesWord = 'badge';
end
if strcmp(switchesWord,'tribe')
	switchesWord = 'tribe';
end
if strcmp(switchesWord,'rheum')
	switchesWord = 'rheum';
end
if strcmp(switchesWord,'patient')
	switchesWord = 'patient';
end
if strcmp(switchesWord,'key')
	switchesWord = 'key';
end
if strcmp(switchesWord,'ducats')
	switchesWord = 'ducats';
end
if strcmp(switchesWord,'Jewish')
	switchesWord = 'Jewish';
end
if strcmp(switchesWord,'run')
	switchesWord = 'run';
end
if strcmp(switchesWord,'turn')
	switchesWord = 'turn';
end
if strcmp(switchesWord,'churn')
	switchesWord = 'churn';
end
if strcmp(switchesWord,'scribe')
	switchesWord = 'scribe';
end
if strcmp(switchesWord,'describe')
	switchesWord = 'describe';
end
if strcmp(switchesWord,'gun')
	switchesWord = 'gun';
end
if strcmp(switchesWord,'shun')
	switchesWord = 'shun';
end
if strcmp(switchesWord,'pun')
	switchesWord = 'pun';
end
if strcmp(switchesWord,'overflow')
	switchesWord = 'overflow';
end
if strcmp(switchesWord,'shekel')
	switchesWord = 'shekel';
end
if strcmp(switchesWord,'tea')
	switchesWord = 'tea';
end
if strcmp(switchesWord,'grate')
	switchesWord = 'grate';
end