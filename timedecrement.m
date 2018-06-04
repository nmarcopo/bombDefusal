function timedecrement(handles)

load('gameMode.mat')
if strcmp(gameMode,'very easy')
    tStart = 420;
elseif strcmp(gameMode,'easy')
    tStart = 420;
elseif strcmp(gameMode,'intermediate')
    tStart = 360;
elseif strcmp(gameMode,'hard')
    tStart = 300;
end
handles.Timer.String = num2str(tStart);

t = str2double(handles.Timer.String);
while t > 0
    if handles.life1.BackgroundColor == [0 .94 1]
        drawnow
        
        t=str2double(handles.Timer.String); %the t value for the string
        
        t=t-1;
        
        %see if t is 0 and do something (stop the game), if not do
        
        handles.Timer.String = num2str(t);%update t
        
        if t < 30 && t >= 10
            [beeping,fs] = audioread('beep.mp3');
            sound(beeping,fs);
        end
        
        if t < 10 && t >= 0
            [beeping,fs] = audioread('beepfast.mp3');
            sound(beeping,fs);
        end
        
        pause(1);
        
    elseif handles.life1.BackgroundColor == [0 .94 .05]
        [yaysound,fs] = audioread('yay.mp3');
        sound(yaysound,fs);
        winScreen;
        break
    else
        [explode,fs] = audioread('lose.mp3');
        sound(explode,fs);
        loseScreen;
        break
    end
    
end
if t == 0
    handles.applyButton.Visible = 'off';
    loseScreen;
end