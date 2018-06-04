function Solution = BombSolution(Bomb)
% Takes input of a bomb and spits out an array with the solutions


% Wires solution
Solution.Wires = WiresSolutionFind(Bomb);

% Switches solution
Solution.Switches = switchesSolutionFind(Bomb);

% Buttons solution

Solution.Buttons = ButtonRules(Bomb);


% Numpad Solution


Solution.Numpad = numpadSolution(Solution, Bomb);


%% Turn it all into one long array

Solution.AllInOne = [Solution.Wires, Solution.Switches, Solution.Buttons, ...
    Solution.Numpad];

