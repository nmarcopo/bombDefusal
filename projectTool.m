function varargout = projectTool(varargin)
% PROJECTTOOL MATLAB code for projectTool.fig
%      PROJECTTOOL, by itself, creates a new PROJECTTOOL or raises the existing
%      singleton*.
%
%      H = PROJECTTOOL returns the handle to a new PROJECTTOOL or the handle to
%      the existing singleton*.
%
%      PROJECTTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTTOOL.M with the given input arguments.
%
%      PROJECTTOOL('Property','Value',...) creates a new PROJECTTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectTool

% Last Modified by GUIDE v2.5 10-Apr-2017 17:31:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @projectTool_OpeningFcn, ...
    'gui_OutputFcn',  @projectTool_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before projectTool is made visible.
function projectTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectTool (see VARARGIN)

% Choose default command line output for projectTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projectTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% [Bomb.positionarrayX,Bomb.positionarrayY,wiresPos,buttonsPos,switchesPos,numpadPos,hideWire,switchesWord] = gridrandomF;
% % Sets position of each panel
% handles.wiresPanel.Position = [Bomb.positionarrayX(1),Bomb.positionarrayY(1),46,20];
% handles.buttonsPanel.Position = [Bomb.positionarrayX(2),Bomb.positionarrayY(2),46,20];
% handles.switchesPanel.Position = [Bomb.positionarrayX(3),Bomb.positionarrayY(3),46,20];
% handles.numPanel.Position = [Bomb.positionarrayX(4),Bomb.positionarrayY(4),46,20];
%
Bomb = BombGenerator;

Solution = BombSolution(Bomb);

%sets position of panels
handles.wiresPanel.Position = [Bomb.positionarrayX(1),Bomb.positionarrayY(1),46,20];
handles.buttonsPanel.Position = [Bomb.positionarrayX(2),Bomb.positionarrayY(2),46,20];
handles.switchesPanel.Position = [Bomb.positionarrayX(3),Bomb.positionarrayY(3),46,20];
handles.numPanel.Position = [Bomb.positionarrayX(4),Bomb.positionarrayY(4),46,20];

% Hides or shows 5th Wire
if Bomb.hideWire == 1
    handles.cutWire5.Visible = 'off';
    handles.wire5.Visible = 'off';
else
    handles.cutWire5.Visible = 'on';
    handles.wire5.Visible = 'on';
end
% x = linspace(0,1,50);
% cos1 = cos(x);
% sin1 = sin(x);
% plot(handles.wire1,x,sin1);
% set(gca,'xtick',[],'ytick',[]);

RedWire = imread('RedWire.png');
BlueWire = imread('BlueWire.png');
YellowWire = imread('YellowWire.png');
GreenWire = imread('GreenWire.png');
OrangeWire = imread('OrangeWire.png');



% First wire image
axes(handles.wire1); % Switches focus to this axes object.
if Bomb.Wires(1) == 1
    
    imshow(RedWire, []);
elseif Bomb.Wires(1) == 2
    
    imshow(BlueWire, []);
    
elseif Bomb.Wires(1) == 3
    
    imshow(YellowWire, []);
    
elseif Bomb.Wires(1) == 4
    
    imshow(GreenWire, []);
    
else
    imshow(OrangeWire, []);
end


% Second wire Image
axes(handles.wire2);
if Bomb.Wires(2) == 1
    
    imshow(RedWire, []);
elseif Bomb.Wires(2) == 2
    
    imshow(BlueWire, []);
    
elseif Bomb.Wires(2) == 3
    
    imshow(YellowWire, []);
    
elseif Bomb.Wires(2) == 4
    
    imshow(GreenWire, []);
    
else
    imshow(OrangeWire, []);
end


% third wire image
axes(handles.wire3);

if Bomb.Wires(3) == 1
    
    imshow(RedWire, []);
elseif Bomb.Wires(3) == 2
    
    imshow(BlueWire, []);
    
elseif Bomb.Wires(3) == 3
    
    imshow(YellowWire, []);
    
elseif Bomb.Wires(3) == 4
    
    imshow(GreenWire, []);
    
else
    imshow(OrangeWire, []);
end


% Fourth wire image
axes(handles.wire4);
if Bomb.Wires(4) == 1
    
    imshow(RedWire, []);
elseif Bomb.Wires(4) == 2
    
    imshow(BlueWire, []);
    
elseif Bomb.Wires(4) == 3
    
    imshow(YellowWire, []);
    
elseif Bomb.Wires(4) == 4
    
    imshow(GreenWire, []);
    
else
    imshow(OrangeWire, []);
end

% fifth wire image
if Bomb.hideWire == 0
    axes(handles.wire5);
    
    if Bomb.Wires(5) == 1
        
        imshow(RedWire, []);
    elseif Bomb.Wires(5) == 2
        
        imshow(BlueWire, []);
        
    elseif Bomb.Wires(5) == 3
        
        imshow(YellowWire, []);
        
    elseif Bomb.Wires(5) == 4
        
        imshow(GreenWire, []);
        
    else
        imshow(OrangeWire, []);
    end
    
else
    axes(handles.wire5);
    cla
end



% shows switches word
handles.switchesText.String = Bomb.switchesWord;


% Button colors
handles.button1.BackgroundColor = Bomb.buttonColor1;
handles.button2.BackgroundColor = Bomb.buttonColor2;
handles.button3.BackgroundColor = Bomb.buttonColor3;
handles.button4.BackgroundColor = Bomb.buttonColor4;

% light color
handles.light1.BackgroundColor = Bomb.lightColor1;
handles.light2.BackgroundColor = Bomb.lightColor2;
handles.light3.BackgroundColor = Bomb.lightColor3;
handles.light4.BackgroundColor = Bomb.lightColor4;

%turns off hints
handles.wiresHint.Visible = 'off';
handles.buttonsHint.Visible = 'off';
handles.numpadHint.Visible = 'off';
handles.switchesHint.Visible = 'off';

Lives = 3;
save('BombCurrent.mat', 'Bomb','Lives', 'Solution');



handles.stop_now = 0;  %# Create stop_now in the handles structure
guidata(hObject,handles);  %# Update the GUI data



timedecrement(handles);







% --- Outputs from this function are returned to the command line.
function varargout = projectTool_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in applyButton.
function applyButton_Callback(hObject, eventdata, handles)
% hObject    handle to applyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% load the solution and bomb file for comparing in the GUI

load('BombCurrent.mat');

% Checks whether each wire is cut and creates a current wire solution
% array
if Bomb.hideWire == 0
    CurrentSolution.Wires = [handles.cutWire1.Value, handles.cutWire2.Value, ...
        handles.cutWire3.Value, handles.cutWire4.Value,...
        handles.cutWire5.Value];
else
    CurrentSolution.Wires = [handles.cutWire1.Value, handles.cutWire2.Value, ...
        handles.cutWire3.Value, handles.cutWire4.Value];
end

% Checks which
CurrentSolution.Buttons = [handles.button1.Value, handles.button2.Value, ...
    handles.button3.Value, handles.button4.Value];

CurrentSolution.Switches = [handles.sliderA.Value, handles.sliderB.Value, ...
    handles.sliderC.Value, handles.sliderD.Value];

CurrentSolution.Numpad = str2double(handles.numDisplay.String);

CurrentSolution.AllInOne = [CurrentSolution.Wires, CurrentSolution.Switches, ...
    CurrentSolution.Buttons, CurrentSolution.Numpad];

load('gameMode.mat');


if CurrentSolution.AllInOne == Solution.AllInOne
    
    handles.life1.BackgroundColor = [0 .94 .05];
    handles.life2.BackgroundColor = [0 .94 .05];
    handles.life3.BackgroundColor = [0 .94 .05];
    
else
    Lives = Lives - 1;
    if Lives == 2
        handles.life3.BackgroundColor = [.4 .4 .4];
        [failsound,fs] = audioread('fail.mp3');
        sound(failsound,fs);
        
        if strcmp(gameMode,'very easy')
            handles.wiresHint.Visible = 'on';
            if CurrentSolution.Wires == Solution.Wires
                handles.wiresHint.BackgroundColor = [0 1 0];
            else
                handles.wiresHint.BackgroundColor = [1 0 0];
                
            end
            
            handles.buttonsHint.Visible = 'on';
            if CurrentSolution.Buttons == Solution.Buttons
                handles.buttonsHint.BackgroundColor = [0 1 0];
            else
                handles.buttonsHint.BackgroundColor = [1 0 0];
            end
            
            handles.switchesHint.Visible = 'on';
            if CurrentSolution.Switches == Solution.Switches
                handles.switchesHint.BackgroundColor = [0 1 0];
            else
                handles.switchesHint.BackgroundColor = [1 0 0];
            end
            
            handles.numpadHint.Visible = 'on';
            if CurrentSolution.Numpad == Solution.Numpad
                handles.numpadHint.BackgroundColor = [0 1 0];
            else
                handles.numpadHint.BackgroundColor = [1 0 0];
            end
        end
    end
    if Lives == 1
        handles.life2.BackgroundColor = [.4 .4 .4];
        [failsound,fs] = audioread('fail.mp3');
        sound(failsound,fs);
        
        if strcmp(gameMode,'very easy')
            handles.wiresHint.Visible = 'on';
            if CurrentSolution.Wires == Solution.Wires
                handles.wiresHint.BackgroundColor = [0 1 0];
            else
                handles.wiresHint.BackgroundColor = [1 0 0];
                
            end
            
            handles.buttonsHint.Visible = 'on';
            if CurrentSolution.Buttons == Solution.Buttons
                handles.buttonsHint.BackgroundColor = [0 1 0];
            else
                handles.buttonsHint.BackgroundColor = [1 0 0];
            end
            
            handles.switchesHint.Visible = 'on';
            if CurrentSolution.Switches == Solution.Switches
                handles.switchesHint.BackgroundColor = [0 1 0];
            else
                handles.switchesHint.BackgroundColor = [1 0 0];
            end
            
            handles.numpadHint.Visible = 'on';
            if CurrentSolution.Numpad == Solution.Numpad
                handles.numpadHint.BackgroundColor = [0 1 0];
            else
                handles.numpadHint.BackgroundColor = [1 0 0];
            end
        end
    end
    if Lives == 0
        handles.life1.BackgroundColor = [.4 .4 .4];
        
        if strcmp(gameMode,'very easy')
            handles.wiresHint.Visible = 'on';
            if CurrentSolution.Wires == Solution.Wires
                handles.wiresHint.BackgroundColor = [0 1 0];
            else
                handles.wiresHint.BackgroundColor = [1 0 0];
                
            end
            
            handles.buttonsHint.Visible = 'on';
            if CurrentSolution.Buttons == Solution.Buttons
                handles.buttonsHint.BackgroundColor = [0 1 0];
            else
                handles.buttonsHint.BackgroundColor = [1 0 0];
            end
            
            handles.switchesHint.Visible = 'on';
            if CurrentSolution.Switches == Solution.Switches
                handles.switchesHint.BackgroundColor = [0 1 0];
            else
                handles.switchesHint.BackgroundColor = [1 0 0];
            end
            
            handles.numpadHint.Visible = 'on';
            if CurrentSolution.Numpad == Solution.Numpad
                handles.numpadHint.BackgroundColor = [0 1 0];
            else
                handles.numpadHint.BackgroundColor = [1 0 0];
            end
        end
        
        handles.applyButton.Visible = 'off';
        %       handles.timeRemaining.Visible = 'off';
        %       handles.Timer.Visible = 'off';
    end
end
save('BombCurrent.mat', 'Bomb','Lives', 'Solution');




% --- Executes on button press in num7.
function num7_Callback(hObject, eventdata, handles)
% hObject    handle to num7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'7'];

% --- Executes on button press in num8.
function num8_Callback(hObject, eventdata, handles)
% hObject    handle to num8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'8'];

% --- Executes on button press in num9.
function num9_Callback(hObject, eventdata, handles)
% hObject    handle to num9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'9'];

% --- Executes on button press in num4.
function num4_Callback(hObject, eventdata, handles)
% hObject    handle to num4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'4'];

% --- Executes on button press in num5.
function num5_Callback(hObject, eventdata, handles)
% hObject    handle to num5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'5'];

% --- Executes on button press in num6.
function num6_Callback(hObject, eventdata, handles)
% hObject    handle to num6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'6'];

% --- Executes on button press in num1.
function num1_Callback(hObject, eventdata, handles)
% hObject    handle to num1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'1'];

% --- Executes on button press in num2.
function num2_Callback(hObject, eventdata, handles)
% hObject    handle to num2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'2'];

% --- Executes on button press in num3.
function num3_Callback(hObject, eventdata, handles)
% hObject    handle to num3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'3'];

% --- Executes on button press in num0.
function num0_Callback(hObject, eventdata, handles)
% hObject    handle to num0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String=[handles.numDisplay.String,'0'];

% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.numDisplay.String='';

% --- Executes on slider movement.
function sliderA_Callback(hObject, eventdata, handles)
% hObject    handle to sliderA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if handles.sliderA.Value >= .5
    handles.sliderA.Value = 1;
else
    handles.sliderA.Value = 0;
end
if handles.sliderA.Value == 1
    handles.switch1text.String = 'ON';
elseif handles.sliderA.Value == 0
    handles.switch1text.String = 'OFF';
end

% --- Executes during object creation, after setting all properties.
function sliderA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderB_Callback(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if handles.sliderB.Value >= .5
    handles.sliderB.Value = 1;
else
    handles.sliderB.Value = 0;
end
if handles.sliderB.Value == 1
    handles.switch2text.String = 'ON';
elseif handles.sliderB.Value == 0
    handles.switch2text.String = 'OFF';
end

% --- Executes during object creation, after setting all properties.
function sliderB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in num3.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to num3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in cutWire1.
function cutWire1_Callback(hObject, eventdata, handles)
% hObject    handle to cutWire1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cutWire1


% --- Executes on button press in cutWire3.
function cutWire3_Callback(hObject, eventdata, handles)
% hObject    handle to cutWire3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cutWire3


% --- Executes on button press in cutWire2.
function cutWire2_Callback(hObject, eventdata, handles)
% hObject    handle to cutWire2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cutWire2


% --- Executes on button press in cutWire4.
function cutWire4_Callback(hObject, eventdata, handles)
% hObject    handle to cutWire4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cutWire4


% --- Executes on button press in cutWire5.
function cutWire5_Callback(hObject, eventdata, handles)
% hObject    handle to cutWire5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cutWire5


% --- Executes on slider movement.
function sliderC_Callback(hObject, eventdata, handles)
% hObject    handle to sliderC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if handles.sliderC.Value >= .5
    
    handles.sliderC.Value = 1;
else
    handles.sliderC.Value = 0;
end
if handles.sliderC.Value == 1
    handles.switch3text.String = 'ON';
elseif handles.sliderC.Value == 0
    handles.switch3text.String = 'OFF';
end

% --- Executes during object creation, after setting all properties.
function sliderC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderD_Callback(hObject, eventdata, handles)
% hObject    handle to sliderD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if handles.sliderD.Value >= .5
    handles.sliderD.Value = 1;
else
    handles.sliderD.Value = 0;
end
if handles.sliderD.Value == 1
    handles.switch4text.String = 'ON';
elseif handles.sliderD.Value == 0
    handles.switch4text.String = 'OFF';
end

% --- Executes during object creation, after setting all properties.
function sliderD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function buttonsPanel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to buttonsPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
