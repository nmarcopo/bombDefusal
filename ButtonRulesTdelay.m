function [ButtonsAnswer, dt]= ButtonRulesTdelay(Bomb)

%% The rules for button rules

% This is the button rules with a simulated time delay for every single
% decision the computer checks.
% This will be simulated for a dt counter that adds 1 sec after each
% decision

% "N" represents the coefficient that can be changed to simulate the time
% it takes to do one decision on average.

% Make sure to put in two values in the Bomb solution to receive the
% correct answer and the dt value.

dt=0;
N=3;

% For Bomb.x
%% Determine color of buton
% Red = 1
% Black = 2
% Blue = 3
% Green = 4

% For Bomb.y
%% Determine color of light above button

% Color Above the Button:
% Red = 2
% Black= 4
% Blue= 3
% Green = 1


%% Different Cases
% First Case: if a blue color button is adjacent to a red color button, and
% the button color and the color above the button are NOT the same
% redBlue & ~sameColor

% Second Case: if a button color and the color above the button are the
% same (and blue color button is adjacent to a red color button)
% redBlue & sameColor

% Third Case, if blue button is NOT adjacent to a red color button, and the
% button color and color above the button for one of the buttons IS the
% same
% ~redBlue & sameColor

% Fourth Case, normal rules: if a blue color button is not adjacent to a red
% color button & button color and color above button is NOT the same
% ~redBlue & ~sameColor

% Structure: Large IF-Statement first deciding if a red color button is
% adjacent to a blue. Then it will check for the second case.
% There are rules with each case.

% In the first case, the lowest value of the multiplied Array is the button
% that should be pressed.
% In the second case, the second highest value of the multiplied Array is
% the button that should be pressed.
% In the third case, the second lowest value of the multiplied Array is the
% button that should be pressed.
% In the fourth case, the highest value of the multiplied Array is the
% button that should be pressed.


% Check if a red color is adjacent to a blue for the color of the button.

redBlue=false;
if Bomb.x(1)==1
    dt=dt+1;
    if Bomb.x(2)==3
        dt=dt+1;
        redBlue=true;
    end
end
if Bomb.x(2)==1
    dt=dt+1;
    if Bomb.x(1)==3
        dt=dt+1;
        redBlue=true;
    end
end
if Bomb.x(3)==1
    dt=dt+1;
    if Bomb.x(4)==3;
        dt=dt+1;
        redBlue=true;
    end
end
if Bomb.x(4)==1
    dt=dt+1;
    if Bomb.x(3)==3;
        dt=dt+1;
        redBlue=true;
    end
end


% Check if the color button has the same color as the light above the
% button
sameColor=false;
for iy=1:4
    dt=dt+1;
    if Bomb.x(iy)==1 && Bomb.y(iy)==2
        dt=dt+1;
        sameColor=true;
    end
    if Bomb.x(iy)==2 && Bomb.y(iy)==4
        dt=dt+1;
        sameColor=true;
    end
    if Bomb.x(iy)==3 && Bomb.y(iy)==3
        dt=dt+1;
        sameColor=true;
    end
    if Bomb.x(iy)==4 && Bomb.y(iy)==1
        dt=dt+1;
        sameColor=true;
    end
end

% Case #1 - For this case, the lowest value should be picked.
if redBlue && ~sameColor
    dt=dt+1;
    %% Determine the multiplied values & store in multArray
    multArray=0;
    for ix=1:4
        dt=dt+1;
        multArray(ix)=Bomb.x(ix)*Bomb.y(ix);
    end
    
    ButtonsAnswer=[0 0 0 0];
    % Compare the values against one another to determine which button should
    % be pressed. This will be transferred to ButtonsAnswer array.
    if multArray(1)<multArray(2) && multArray(1)<multArray(3) && multArray(1)<multArray(4)
        dt=dt+1;
        ButtonsAnswer=[1 0 0 0]; % 1 Represents the first switch should be pressed
    end
    if multArray(2)<multArray(1) && multArray(2)<multArray(3) && multArray(2)<multArray(4)
        dt=dt+1;
        ButtonsAnswer=[0 1 0 0]; % 2 Represents the second switch should be pressed
    end
    if multArray(3)<multArray(1) && multArray(3)<multArray(2) && multArray(3)<multArray(4)
        dt=dt+1;
        ButtonsAnswer=[0 0 1 0];
    end
    if multArray(4)<multArray(1) && multArray(4)<multArray(2) && multArray(4)<multArray(3)
        dt=dt+1;
        ButtonsAnswer=[0 0 0 1];
    end
    
    % If two buttons share the same value, then the button pressed is button
    % whose value is lower (not counting the two values).
    sameValue=false;
    % The two same positions are stored in sameArray marking which positions are the same
    
    % This procedure will create an array "sameArray" that will mark a Value of
    % 1 based if the values of two buttons are the same. Up to 3 buttons can be
    % the same.
    
    sameArray=[0 0 0 0]; % initialization counter
    % sameValue is a logic variable that will become true if two or more
    % buttons share the same multiplied value. This is a base in the program to
    % check to see if it is working correctly.
    for ic=1:3
        if multArray(1)==multArray(ic+1)
            dt=dt+1;
            sameValue=true;
            sameArray(1)=1;
            sameArray(ic+1)=1;
        end
    end
    for ic=3:4
        if multArray(2)==multArray(ic)
            dt=dt+1;
            sameValue=true;
            sameArray(2)=1;
            sameArray(ic)=1;
        end
    end
    if multArray(3)==multArray(4)
        dt=dt+1;
        sameValue=true;
        sameArray(3)=1;
        sameArray(4)=1;
    end
    
    % If sameValue is true, then there are two or more values that are the
    % same. Thus, the correct button pressed will be the greater of the two
    % remaining values. If three buttons are the same, the correct button
    % pressed will be the remaining button (the one with the different value.)
    
    % Check to see if three of the values are the same.
    switch sum(sameArray) % if three values are the same, then the sum of sameValue array will be 3.
        case 3
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                ButtonsAnswer=[0 0 0 1];
            end
            if sameArray(1)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[0 1 0 0];
            end
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[0 0 1 0];
            end
            if sameArray(2)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[1 0 0 0];
            end
        case 2      % if two values are the same, then the sum of sameValue will be 2.
            % Each "if" section will compare if two button values are the same.
            % If two are the same, then the program will compare the other two
            % values of the buttons and see which button is the lower value.
            % If two repeating values are the lowest, then the leftmost
            % button will be pressed.
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1
                % Determine if MultArray(1) is the lowest value.
                dt=dt+1;
                if multArray(1)<multArray(3) && multArray(1)<multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    dt=dt+1;
                    if multArray(3)<multArray(4)
                       dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 0 1];
                    end
                end
            end
            if sameArray(1)==1 && sameArray(3)==1
                dt=dt+1;
                % Determine if MultArray(1) is the lowest value.
                if multArray(1)<multArray(2) && multArray(1)<multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    if multArray(2)<multArray(4);
                        dt=dt+1;
                        ButtonsAnswer=[0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[0 0 0 1];
                    end
                end
            end
            if sameArray(1)==1 && sameArray(4)==1
                dt=dt+1;
                % Determine if MultArray(1) is the lowest value.
                if multArray(1)<multArray(2) && multArray(1)<multArray(3)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    if multArray(2)<multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 1 0];
                    end
                end
            end
            if sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                % Determine if MultArray(2) is the lowest value.
                if multArray(2)<multArray(1) && multArray(2)<multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    if multArray(1)<multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 0 1];
                    end
                end
            end
            
            if sameArray(2)==1 && sameArray(4)==1
                % Determine if MultArray(2) is the lowest value.
                dt=dt+1;
                if multArray(2)<multArray(3) && multArray(2)<multArray(1)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    if multArray(1)<multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 1 0];
                    end
                end
            end
            if sameArray(3)==1 && sameArray(4)==1
                % Determine if MultArray(3) is the lowest value.
                dt=dt+1;
                if multArray(3)<multArray(1) && multArray(3)<multArray(2)
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                else
                    if multArray(1)<multArray(2)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 1 0 0];
                    end
                end
            end
    end
    % If there are two sets of repeated values, then the button corresponding
    % to the blue light above it will be pressed.
    % Check which position the blue light (value 3) is in in array "y"
    if multArray(1)==multArray(2) && multArray(3)==multArray(4) || ...
            multArray(1)==multArray(3) && multArray(2) == multArray(4) || ...
            multArray(1)==multArray(4) && multArray(2)==multArray(3)
        dt=dt+1;
        for ip=1:4
            if Bomb.y(ip)==3
                dt=dt+1;
                ButtonsAnswer=[0 0 0 0];
                ButtonsAnswer(ip)= 1;
            end
        end
    end
    
    
    % Case #2: The second highest value should be picked
elseif redBlue && sameColor
    dt=dt+1;
    %% Determine the multiplied values & store in multArray
    multArray=0;
    for ix=1:4
        dt=dt+1;
        multArray(ix)=Bomb.x(ix)*Bomb.y(ix);
    end
    
    ButtonsAnswer=[0 0 0 0];
    % Compare the values against one another to determine which button should
    % be pressed. This will be transferred to ButtonsAnswer array.
    if multArray(1)>multArray(2) && multArray(1)>multArray(3) && multArray(1)>multArray(4)
        % This means that multArray(1) is the highest value. Next we must
        % compare the other values to find the second highest value.
        dt=dt+1;
        if multArray(2)>multArray(3) && multArray(2)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(3)>multArray(2) && multArray(3)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
        if multArray(4)>multArray(2) && multArray(4)>multArray(3)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    
    if multArray(2)>multArray(1) && multArray(2)>multArray(3) && multArray(2)>multArray(4)
        dt=dt+1;
        if multArray(1)>multArray(3) && multArray(1)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(3)>multArray(1) && multArray(3)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
        if multArray(4)>multArray(1) && multArray(4)>multArray(3)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    
    if multArray(3)>multArray(1) && multArray(3)>multArray(2) && multArray(3)>multArray(4)
        dt=dt+1;
        if multArray(1)>multArray(2) && multArray(1)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(2)>multArray(1) && multArray(2)>multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(4)>multArray(2) && multArray(4)>multArray(1)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    if multArray(4)>multArray(1) && multArray(4)>multArray(2) && multArray(4)>multArray(3)
        dt=dt+1;
        if multArray(1)>multArray(2) && multArray(1)>multArray(3)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(2)>multArray(3) && multArray(2)>multArray(1)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(3)>multArray(1) && multArray(3)>multArray(2)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
    end
    
    
    sameValue=false;
    % The two same positions are stored in sameArray marking which positions are the same
    
    % This procedure will create an array "sameArray" that will mark a Value of
    % 1 based if the values of two buttons are the same. Up to 3 buttons can be
    % the same.
    
    sameArray=[0 0 0 0]; % initialization counter
    % sameValue is a logic variable that will become true if two or more
    % buttons share the same multiplied value. This is a base in the program to
    % check to see if it is working correctly.
    for ic=1:3
        if multArray(1)==multArray(ic+1)
            dt=dt+1;
            sameValue=true;
            sameArray(1)=1;
            sameArray(ic+1)=1;
        end
    end
    for ic=3:4
        dt=dt+1;
        if multArray(2)==multArray(ic)
            dt=dt+1;
            sameValue=true;
            sameArray(2)=1;
            sameArray(ic)=1;
        end
    end
    if multArray(3)==multArray(4)
        dt=dt+1;
        sameValue=true;
        sameArray(3)=1;
        sameArray(4)=1;
    end
    
    % If sameValue is true, then there are two or more values that are the
    % same. If three buttons are the same, the correct button
    % pressed will be the remaining button (the one with the different value.)
    
    % Check to see if three of the values are the same.
    % One must check if the value that is tripled is greater than or lower
    % than the remaining value.
    % If the triple value is above the other value, the other value is picked. If the triple value is smaller than
    % the other value, any three of the repeated values can be the
    % 2nd biggest value. In this case, the middlemost button is pressed.
    switch sum(sameArray) % if three values are the same, then the sum of sameValue array will be 3.
        case 3
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(1)>multArray(4)
                   dt=dt+1;
                    ButtonsAnswer=[0 0 0 1];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                end
            end
            if sameArray(1)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)>multArray(2)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)>multArray(3)
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            if sameArray(2)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(2)>multArray(1)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            
        case 2      % if two values are the same, then the sum of sameValue will be 2.
            % Each "if" section will compare if two button values are the same.
            % If two are the same, then the program will compare the other two
            % values of the buttons and see which button is the highest value.
            % If the two values are the middlemost values (2nd highest),
            % then the leftmost button is picked.
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1
                dt=dt+1;
                if multArray(1)>multArray(3) && multArray(1)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(3)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(1)<multArray(3) && multArray(1)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;    
                    if multArray(3)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                    
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0];
                end
                
            elseif sameArray(1)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(1)<multArray(2) && multArray(1)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;
                        if multArray(2)>multArray(4)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 0 1];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 0 1 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0]; % If the two values are the middle values
                end
                
                
            elseif sameArray(1)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(3) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(2)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                    
                    elseif multArray(1)<multArray(2) && multArray(1)<multArray(3) %% If the two values are the lowest values
                        dt=dt+1;
                        if multArray(2)>multArray(3)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 1 0];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 0 1 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0]; % If the two values are the middle values
                end
            elseif sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(2)>multArray(1) && multArray(2)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(1)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(2)<multArray(1) && multArray(2)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;
                        if multArray(1)>multArray(4)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 0 1];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 0 1 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 1 0 0]; % If the two values are the middle values
                end
                
                
            elseif sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(2)>multArray(1) && multArray(2)>multArray(3) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(1)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                elseif multArray(2)<multArray(1) && multArray(2)<multArray(3) %% If the two values are the lowest values
                    dt=dt+1;
                        if multArray(1)>multArray(3)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 1 0];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 1 0 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 1 0 0]; % If the two values are the middle values
                end
                
                
                
            elseif sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(3)>multArray(2) && multArray(3)>multArray(1) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(3)<multArray(2) && multArray(3)<multArray(1) %% If the two values are the lowest values
                    dt=dt+1;
                        if multArray(2)>multArray(4)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 0 1];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 0 1 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 0 1 0]; % If the two values are the middle values
                end
                
                
            end
    end
    
    % If there are two sets of repeated values, then the button corresponding
    % to the blue light above it will be pressed.
    % Check which position the blue light (value 3) is in in array "y"
    if multArray(1)==multArray(2) && multArray(3)==multArray(4) || ...
            multArray(1)==multArray(3) && multArray(2) == multArray(4) || ...
            multArray(1)==multArray(4) && multArray(2)==multArray(3)
        dt=dt+1;
        for ip=1:4
            dt=dt+1;
            if Bomb.y(ip)==3
                dt=dt+1;
                ButtonsAnswer=[0 0 0 0];
                ButtonsAnswer(ip)= 1;
            end
        end
    end
    
    
    
    % Case 3: In this case, the second lowest value of the multArray will be picked.
elseif ~redBlue && sameColor
    %% Determine the multiplied values & store in multArray
    multArray=0;
    for ix=1:4
        dt=dt+1;
        multArray(ix)=Bomb.x(ix)*Bomb.y(ix);
    end
    
    ButtonsAnswer=[0 0 0 0];
    % Compare the values against one another to determine which button should
    % be pressed. This will be transferred to ButtonsAnswer array.
    if multArray(1)<multArray(2) && multArray(1)<multArray(3) && multArray(1)<multArray(4)
        dt=dt+1;
        % This means that multArray(1) is the lowest value. Next we must
        % compare the other values to find the second lowest value.
        if multArray(2)<multArray(3) && multArray(2)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(3)<multArray(2) && multArray(3)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
        if multArray(4)<multArray(2) && multArray(4)<multArray(3)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    
    if multArray(2)<multArray(1) && multArray(2)<multArray(3) && multArray(2)<multArray(4)
        dt=dt+1;
        if multArray(1)<multArray(3) && multArray(1)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(3)<multArray(1) && multArray(3)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
        if multArray(4)<multArray(1) && multArray(4)<multArray(3)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    
    if multArray(3)<multArray(1) && multArray(3)<multArray(2) && multArray(3)<multArray(4)
        dt=dt+1;
        if multArray(1)<multArray(2) && multArray(1)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(2)<multArray(1) && multArray(2)<multArray(4)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(4)<multArray(2) && multArray(4)<multArray(1)
            dt=dt+1;
            ButtonsAnswer=[0 0 0 1];
        end
    end
    if multArray(4)<multArray(1) && multArray(4)<multArray(2) && multArray(4)<multArray(3)
        dt=dt+1;
        if multArray(1)<multArray(2) && multArray(1)<multArray(3)
            dt=dt+1;
            ButtonsAnswer=[1 0 0 0];
        end
        if multArray(2)<multArray(3) && multArray(2)<multArray(1)
            dt=dt+1;
            ButtonsAnswer=[0 1 0 0];
        end
        if multArray(3)<multArray(1) && multArray(3)<multArray(2)
            dt=dt+1;
            ButtonsAnswer=[0 0 1 0];
        end
    end
    
    
    sameValue=false;
    % The two same positions are stored in sameArray marking which positions are the same
    
    % This procedure will create an array "sameArray" that will mark a Value of
    % 1 based if the values of two buttons are the same. Up to 3 buttons can be
    % the same.
    
    sameArray=[0 0 0 0]; % initialization counter
    % sameValue is a logic variable that will become true if two or more
    % buttons share the same multiplied value. This is a base in the program to
    % check to see if it is working correctly.
    for ic=1:3
        dt=dt+1;
        if multArray(1)==multArray(ic+1)
            dt=dt+1;
            sameValue=true;
            sameArray(1)=1;
            sameArray(ic+1)=1;
        end
    end
    for ic=3:4
        if multArray(2)==multArray(ic)
            dt=dt+1;
            sameValue=true;
            sameArray(2)=1;
            sameArray(ic)=1;
        end
    end
    if multArray(3)==multArray(4)
        dt=dt+1;
        sameValue=true;
        sameArray(3)=1;
        sameArray(4)=1;
    end
    
    % If sameValue is true, then there are two or more values that are the
    % same. If three buttons are the same, the correct button
    % pressed will be the remaining button (the one with the different value.)
    
    % Check to see if three of the values are the same.
    % One must check if the value that is tripled is greater than or lower
    % than the remaining value.
    % If the triple value is below the other value, the other value is picked. If the triple value is greater than
    % the other value, any three of the repeated values can be the
    % 2nd biggest value. In this case, the middlemost button is pressed.
    switch sum(sameArray) % if three values are the same, then the sum of sameValue array will be 3.
        case 3
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(1)<multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[0 0 0 1];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                end
            end
            if sameArray(1)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)<multArray(2)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)<multArray(3)
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            if sameArray(2)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(2)<multArray(1)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                end
            end
            
        case 2      % if two values are the same, then the sum of sameValue will be 2.
            % Each "if" section will compare if two button values are the same.
            % If two are the same, then the program will compare the other two
            % values of the buttons and see which button is the highest value.
            % If the two values are the middlemost values (2nd highest),
            % then the leftmost button is picked.
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1
                dt=dt+1;
                if multArray(1)>multArray(3) && multArray(1)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(3)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(1)<multArray(3) && multArray(1)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;  
                    if multArray(3)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0];
                end
                
            elseif sameArray(1)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(1)<multArray(2) && multArray(1)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;    
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0]; % If the two values are the middle values
                end
                
                
            elseif sameArray(1)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(3) %% If the two values are the greatest values
                   dt=dt+1;
                    if multArray(2)>multArray(3)
                       dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                elseif multArray(1)<multArray(2) && multArray(1)<multArray(3) %% If the two values are the lowest values
                    dt=dt+1;    
                    if multArray(2)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 1 0 0 0]; % If the two values are the middle values
                end
                
            elseif sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                if multArray(2)>multArray(1) && multArray(2)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(1)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(2)<multArray(1) && multArray(2)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;    
                    if multArray(1)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 1 0 0]; % If the two values are the middle values
                end
                
                
            elseif sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(2)>multArray(1) && multArray(2)>multArray(3) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(1)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    end
                elseif multArray(2)<multArray(1) && multArray(2)<multArray(3) %% If the two values are the lowest values
                    dt=dt+1;
                        if multArray(1)>multArray(3)
                            dt=dt+1;
                            ButtonsAnswer=[ 0 0 1 0];
                        else
                            dt=dt+1;
                            ButtonsAnswer=[ 1 0 0 0];
                        end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 1 0 0]; % If the two values are the middle values
                end
                
                
                
            elseif sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(4) %% If the two values are the greatest values
                    dt=dt+1;
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    end
                elseif multArray(1)<multArray(2) && multArray(1)<multArray(4) %% If the two values are the lowest values
                    dt=dt+1;    
                    if multArray(2)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 0 1];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    end
                else
                    dt=dt+1;
                    ButtonsAnswer=[ 0 0 1 0]; % If the two values are the middle values
                end
                
                
            end
    end
    
    % If there are two sets of repeated values, then the button corresponding
    % to the blue light above it will be pressed.
    % Check which position the blue light (value 3) is in in array "y"
    if multArray(1)==multArray(2) && multArray(3)==multArray(4) || ...
            multArray(1)==multArray(3) && multArray(2) == multArray(4) || ...
            multArray(1)==multArray(4) && multArray(2)==multArray(3)
        for ip=1:4
            dt=dt+1;
            if Bomb.y(ip)==3
                dt=dt+1;
                ButtonsAnswer=[0 0 0 0];
                ButtonsAnswer(ip)= 1;
            end
        end
    end
    
    
    
    % Case 4: In this case, the highest value of the multArray will be picked.
elseif ~redBlue && ~sameColor
    dt=dt+1;
    %% Determine the multiplied values & store in multArray
    multArray=0;
    for ix=1:4
        dt=dt+1;
        multArray(ix)=Bomb.x(ix)*Bomb.y(ix);
    end
    
    ButtonsAnswer=[0 0 0 0];
    % Compare the values against one another to determine which button should
    % be pressed. This will be transferred to ButtonsAnswer array.
    if multArray(1)>multArray(2) && multArray(1)>multArray(3) && multArray(1)>multArray(4)
        dt=dt+1;
        ButtonsAnswer=[1 0 0 0]; % 1 Represents the first switch should be pressed
    end
    if multArray(2)>multArray(1) && multArray(2)>multArray(3) && multArray(2)>multArray(4)
        dt=dt+1;
        ButtonsAnswer=[0 1 0 0]; % 2 Represents the second switch should be pressed
    end
    if multArray(3)>multArray(1) && multArray(3)>multArray(2) && multArray(3)>multArray(4)
        dt=dt+1;
        ButtonsAnswer=[0 0 1 0];
    end
    if multArray(4)>multArray(1) && multArray(4)>multArray(2) && multArray(4)>multArray(3)
        dt=dt+1;
        ButtonsAnswer=[0 0 0 1];
    end
    
    % If two buttons share the same value, then the button pressed is button
    % whose value is higher (not counting the two values).
    sameValue=false;
    % The two same positions are stored in sameArray marking which positions are the same
    
    % This procedure will create an array "sameArray" that will mark a Value of
    % 1 based if the values of two buttons are the same. Up to 3 buttons can be
    % the same.
    
    sameArray=[0 0 0 0]; % initialization counter
    % sameValue is a logic variable that will become true if two or more
    % buttons share the same multiplied value. This is a base in the program to
    % check to see if it is working correctly.
    for ic=1:3
        dt=dt+1;
        if multArray(1)==multArray(ic+1)
            dt=dt+1;
            sameValue=true;
            sameArray(1)=1;
            sameArray(ic+1)=1;
        end
    end
    for ic=3:4
        dt=dt+1;
        if multArray(2)==multArray(ic)
            dt=dt+1;
            sameValue=true;
            sameArray(2)=1;
            sameArray(ic)=1;
        end
    end
    if multArray(3)==multArray(4)
        dt=dt+1;
        sameValue=true;
        sameArray(3)=1;
        sameArray(4)=1;
    end
    
    % If sameValue is true, then there are two or more values that are the
    % same. Thus, the correct button pressed will be the greater of the two
    % remaining values. If three buttons are the same, the correct button
    % pressed will be the remaining button (the one with the different value.)
    
    % Check to see if three of the values are the same.
    switch sum(sameArray) % if three values are the same, then the sum of sameValue array will be 3.
        case 3
            dt=dt+1;
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                ButtonsAnswer=[0 0 0 1];
            end
            if sameArray(1)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[0 1 0 0];
            end
            if sameArray(1)==1 && sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[0 0 1 0];
            end
            if sameArray(2)==1 && sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                ButtonsAnswer=[1 0 0 0];
            end
        case 2      % if two values are the same, then the sum of sameValue will be 2.
            % Each "if" section will compare if two button values are the same.
            % If two are the same, then the program will compare the other two
            % values of the buttons and see which button is the highest value.
            % If the two repeated values are the highest value, then the
            % leftmost value is picked.
            dt=dt+1;
            
            if sameArray(1)==1 && sameArray(2)==1
                dt=dt+1;
                % Determine if MultArray(1) is the highest value.
                if multArray(1)>multArray(3) && multArray(1)>multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    if multArray(3)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 0 1 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 0 1];
                    end
                end
            end
            if sameArray(1)==1 && sameArray(3)==1
                dt=dt+1;
                % Determine if MultArray(1) is the highest value.
                if multArray(1)>multArray(2) && multArray(1)>multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    if multArray(2)>multArray(4);
                        dt=dt+1;
                        ButtonsAnswer=[0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer=[0 0 0 1];
                    end
                end
            end
            if sameArray(1)==1 && sameArray(4)==1
                % Determine if MultArray(1) is the highest value.
                dt=dt+1;
                if multArray(1)>multArray(2) && multArray(1)>multArray(3)
                    dt=dt+1;
                    ButtonsAnswer=[1 0 0 0];
                else
                    if multArray(2)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 0 1 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 1 0];
                    end
                end
            end
            if sameArray(2)==1 && sameArray(3)==1
                dt=dt+1;
                % Determine if MultArray(2) is the highest value.
                if multArray(2)>multArray(1) && multArray(2)>multArray(4)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    if multArray(1)>multArray(4)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 0 1];
                    end
                end
            end
            
            if sameArray(2)==1 && sameArray(4)==1
                dt=dt+1;
                % Determine if MultArray(2) is the highest value.
                if multArray(2)>multArray(3) && multArray(2)>multArray(1)
                    dt=dt+1;
                    ButtonsAnswer=[0 1 0 0];
                else
                    if multArray(1)>multArray(3)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 0 1 0];
                    end
                end
            end
            if sameArray(3)==1 && sameArray(4)==1
                dt=dt+1;
                % Determine if MultArray(3) is the highest value.
                if multArray(3)>multArray(1) && multArray(3)>multArray(2)
                    dt=dt+1;
                    ButtonsAnswer=[0 0 1 0];
                else
                    if multArray(1)>multArray(2)
                        dt=dt+1;
                        ButtonsAnswer=[ 1 0 0 0];
                    else
                        dt=dt+1;
                        ButtonsAnswer = [0 1 0 0];
                    end
                end
            end
    end
    % If there are two sets of repeated values, then the button corresponding
    % to the blue light above it will be pressed.
    % Check which position the blue light (value 3) is in in array "y"
    if multArray(1)==multArray(2) && multArray(3)==multArray(4) || ...
            multArray(1)==multArray(3) && multArray(2) == multArray(4) || ...
            multArray(1)==multArray(4) && multArray(2)==multArray(3)
        for ip=1:4
            dt=dt+1;
            if Bomb.y(ip)==3
                dt=dt+1;
                ButtonsAnswer=[0 0 0 0];
                ButtonsAnswer(ip)= 1;
            end
        end
    end
end

dt=dt*N;


