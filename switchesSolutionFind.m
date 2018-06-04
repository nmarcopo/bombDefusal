function switchesSolution = switchesSolutionFind(Bomb)

% Determines Solution to the Switches panel
switchesSolution = zeros(1,4); 	% initialized solution list (0) being down and (1) being up
selectedword = Bomb.switchesWord;
selectWdLength = length(Bomb.switchesWord);  % length of the selected word

wordlist = {'spurn','badge','tribe','rheum','patient','key','ducats','Jewish'};
selectwordrow = 0;
for i = 1:8
    if strcmp(wordlist(i),selectedword)
        selectwordrow = 1;
        
    end
end

% if the word has a vowel as the second letter, the first switch is up
if strcmp(selectedword(2),'a') || strcmp(selectedword(2),'e')|| strcmp(selectedword(2),'i') || strcmp(selectedword(2),'o')|| strcmp(selectedword(2),'u')
	switchesSolution(1,1) = 1;
end

% if the word ends in 'n', the second switch is up
if strcmp(selectedword(selectWdLength),'n')
	switchesSolution(1,2) = 1;
end

% if the word ends with 'bribe', 'bun', or 'burn', the third switch is up
if selectWdLength >= 4
	if strcmp(selectedword(selectWdLength - 3:selectWdLength),'ribe')...
        	|| strcmp(selectedword(selectWdLength - 1:selectWdLength),'un')...
        	|| strcmp(selectedword(selectWdLength - 2:selectWdLength),'urn')
    	switchesSolution(1,3) = 1;
	end
end
if selectWdLength == 3
	if strcmp(selectedword(selectWdLength - 1:selectWdLength),'un')...
        	|| strcmp(selectedword(selectWdLength - 2:selectWdLength),'urn')
    	switchesSolution(1,3) = 1;
	end
end

% if the word is in the selected Shakespeare passage, (and the words
% selected are in the first two rows of the word list) the fourth switch
% is up
if selectwordrow == 1
	switchesSolution(1,4) = 1;
end