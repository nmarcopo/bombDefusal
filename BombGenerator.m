function Bomb = BombGenerator
%% Bomb generator
% Creates a structured array called bomb using the randomization fuunctions
% that contains all the information of said randomized bomb

rng('shuffle')


%% Wires

[Bomb.Wires, WireNum] = Wires;



%% Module Random Placement


[Bomb.positionarrayX, Bomb.positionarrayY, Bomb.wiresPos, Bomb.buttonsPos, ...
    Bomb.switchesPos, Bomb.numpadPos, Bomb.hideWire, ...
    Bomb.switchesWord] = gridrandomF(WireNum);

%% Button Generator

[ColorsArray, Bomb.x, Bomb.y] = ButtonsGenerator;

Bomb.buttonColor1 = ColorsArray.buttonColor1;
Bomb.buttonColor2 = ColorsArray.buttonColor2;
Bomb.buttonColor3 = ColorsArray.buttonColor3;
Bomb.buttonColor4 = ColorsArray.buttonColor4;

Bomb.lightColor1 = ColorsArray.lightColor1;
Bomb.lightColor2 = ColorsArray.lightColor2;
Bomb.lightColor3 = ColorsArray.lightColor3;
Bomb.lightColor4 = ColorsArray.lightColor4;

