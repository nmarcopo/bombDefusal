function [switchesSolution,dt] = switchesSolutionFindTdelay(Bomb)

dt=0;
% This will have dt values of 4N, 5N, or 6N depending on whether or not the word rhymes or if the word is inside the passage.
% In order to simulate longer time to read the Shakespeare passage, the
% overall dt value will be multiplied by a coefficient (N).

N=9;
% Make sure to call two values in the Bomb solution function to find the
% switchesSolution and the dt value.

% Determines Solution to the Switches panel
switchesSolution = zeros(1,4); 	% initialized solution list (0) being down and (1) being up

selectedword = Bomb.switchesWord;
selectwordrow = 0;
if strcmp(selectedword,'Jewish') || strcmp(selectedword,'spurn') || strcmp(selectedword,'badge') || strcmp(selectedword,'tribe')
    selectwordrow = 1;
elseif strcmp(selectedword,'rheum') || strcmp(selectedword,'patient') || strcmp(selectedword,'key') || strcmp(selectedword,'ducat')
    selectwordrow = 2;
end

selectWdLength = length(Bomb.switchesWord);  % length of the selected word

% There is time spent checking for each switch. 
	dt=dt+1;
% if the word has a vowel as the second letter, the first switch is up
if strcmp(selectedword(2),'a') || strcmp(selectedword(2),'e')|| strcmp(selectedword(2),'i') || strcmp(selectedword(2),'o')|| strcmp(selectedword(2),'u')

    switchesSolution(1,1) = 1;
end

	dt=dt+1;
% if the word ends in 'n', the second switch is up
if strcmp(selectedword(selectWdLength),'n')

    switchesSolution(1,2) = 1;
end

	dt=dt+1;
% if the word ends with 'bribe', 'bun', or 'burn', the third switch is up
if selectWdLength >= 4
    if strcmp(selectedword(selectWdLength - 3:selectWdLength),'ribe')...
        	|| strcmp(selectedword(selectWdLength - 1:selectWdLength),'un')...
        	|| strcmp(selectedword(selectWdLength - 2:selectWdLength),'urn')

        switchesSolution(1,3) = 1;
    else
        dt=dt+1; % If no words rhyme, you have to check all three words. Therefore there is a longer time delay.
	end
end
if selectWdLength == 3

	if strcmp(selectedword(selectWdLength - 1:selectWdLength),'un')...
        	|| strcmp(selectedword(selectWdLength - 2:selectWdLength),'urn')

        switchesSolution(1,3) = 1;
    else
        	dt=dt+1; % If the word does not rhyme, you have to check all three words. Therefore there is a longer time delay.
	end
end

% if the word is in the selected Shakespeare passage, (and the words
% selected are in the first two rows of the word list) the fourth switch
% is up
	dt=dt+1;
if selectwordrow == 1 || selectwordrow == 2
% They could find the word in no time at all, therefore no additionally
% delay if you find the word.

	switchesSolution(1,4) = 1;
else
    dt=dt+1; % If the word is not in the passage, a person will always read it to the end while trying to find the word.
    % This means that the time delay is increased.
end

dt=dt*N;