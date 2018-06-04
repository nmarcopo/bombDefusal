function [bomb, x, y] = ButtonsGenerator

rng('shuffle')

% This will output a series of RGB values in a 1x1 structure with headings
%% Determine Color Inside Button
% Red = 1
% Black =2
% Blue = 3
% Green = 4

% Red [1,0,0]
% Black [0,0,0]
% Blue [0,0,1]
% Green [0,1,0]


ButtonColorInL = 4;
cIn(1) = randi(ButtonColorInL);

cIn(2) = randi(ButtonColorInL);
while cIn(2) == cIn(1)
    cIn(2) = randi(ButtonColorInL);
end

cIn(3) = randi(ButtonColorInL);
while cIn(3) == cIn(2) || cIn(3) == cIn(1)
    cIn(3) = randi(ButtonColorInL);
end

cIn(4) = randi(ButtonColorInL);
while cIn(4) == cIn(3) || cIn(4) == cIn(2) || cIn(4) ==cIn(1)
    cIn(4)= randi(ButtonColorInL);
end
%% Determine Color Outside
% 2 gives red
% 4 gives black
% 3 gives blue
% 1 gives green
ButtonColorOutL = 4;

cOut(1) = randi(ButtonColorOutL);

cOut(2) = randi(ButtonColorOutL);
while cOut(2) == cOut(1)
    cOut(2) = randi(ButtonColorOutL);
end

cOut(3) = randi(ButtonColorOutL);
while cOut(3) == cOut(2) || cOut(3) == cOut(1)
    cOut(3) = randi(ButtonColorOutL);
end

cOut(4) = randi(ButtonColorOutL);
while cOut(4) == cOut(3) || cOut(4) == cOut(2) || cOut(4) ==cOut(1)
    cOut(4)= randi(ButtonColorOutL);
end

 
x = cIn;
y = cOut;

%% Transform values of the colors into the respective RGB values to be placed in the GUI
% Translate Color into Specific RGB Values for GUI
% Red [1, 0, 0]
% Black [0,0,0]
% Blue [0,0,1]
% Green [0,1,0]

buttonColor=[];
for ix=1:4
    if x(ix)==1
        buttonColor(ix,:)=[1,0,0];
    elseif x(ix)==2
        buttonColor(ix,:)=[0,0,0];
    elseif x(ix)==3
        buttonColor(ix,:)=[0,0,1];
    elseif x(ix)==4
        buttonColor(ix,:)=[0,1,0];
    end
end

lightColor=[];
for iy=1:4
    if y(iy)==1
        lightColor(iy,:)=[0,1,0];
    elseif y(iy)==2
        lightColor(iy,:)=[1,0,0];
    elseif y(iy)==3
        lightColor(iy,:)=[0,0,1];
    elseif y(iy)==4
        lightColor(iy,:)=[0,0,0];
    end
end

%% Place values into a structure
bomb.buttonColor1=[buttonColor(1,:)];
bomb.buttonColor2=[buttonColor(2,:)];
bomb.buttonColor3=[buttonColor(3,:)];
bomb.buttonColor4=[buttonColor(4,:)];


bomb.lightColor1=[lightColor(1,:)];
bomb.lightColor2=[lightColor(2,:)];
bomb.lightColor3=[lightColor(3,:)];
bomb.lightColor4=[lightColor(4,:)];


