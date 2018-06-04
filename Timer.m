function Count = Timer
% Counts down from 60 seconds

Count = 60;

for it = 1:60
    
    Count = Count - 1;
    pause(1)
    disp(Count);
end