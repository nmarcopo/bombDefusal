function varargout = initialMenu(varargin)
% INITIALMENU MATLAB code for initialMenu.fig
%      INITIALMENU, by itself, creates a new INITIALMENU or raises the existing
%      singleton*.
%
%      H = INITIALMENU returns the handle to a new INITIALMENU or the handle to
%      the existing singleton*.
%
%      INITIALMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITIALMENU.M with the given input arguments.
%
%      INITIALMENU('Property','Value',...) creates a new INITIALMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before initialMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to initialMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help initialMenu

% Last Modified by GUIDE v2.5 23-Apr-2017 13:50:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @initialMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @initialMenu_OutputFcn, ...
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


% --- Executes just before initialMenu is made visible.
function initialMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to initialMenu (see VARARGIN)

% Choose default command line output for initialMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes initialMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);
BombImage = imread('BombPic.png');

BombImageBig = imresize(BombImage, 1.25, 'bilinear');

axes(handles.BombAxes);


imshow(BombImageBig, []);



% --- Outputs from this function are returned to the command line.
function varargout = initialMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in simulationButton.
function simulationButton_Callback(hObject, eventdata, handles)
% hObject    handle to simulationButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bombSimulationTool;

% --- Executes on button press in gameButton.
function gameButton_Callback(hObject, eventdata, handles)
% hObject    handle to gameButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.easy.Value == 1
    gameMode = 'easy';
elseif handles.intermediate.Value == 1
    gameMode = 'intermediate';
elseif handles.hard.Value == 1
    gameMode = 'hard';
elseif handles.veryeasy.Value == 1
    gameMode = 'very easy';
end
save('gameMode.mat','gameMode');

projectTool;

% --- Executes on selection change in popUpMenu.
function popUpMenu_Callback(hObject, eventdata, handles)
% hObject    handle to popUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popUpMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popUpMenu
if handles.popUpMenu.Value == 2
   simulationHelp;
elseif handles.popUpMenu.Value == 3
   gameHelp;
elseif handles.popUpMenu.Value == 4
   methodHelp;
end

% --- Executes during object creation, after setting all properties.
function popUpMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popUpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in easy.
function easy_Callback(hObject, eventdata, handles)
% hObject    handle to easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of easy


% --- Executes on button press in intermediate.
function intermediate_Callback(hObject, eventdata, handles)
% hObject    handle to intermediate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of intermediate


% --- Executes on button press in hard.
function hard_Callback(hObject, eventdata, handles)
% hObject    handle to hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hard
