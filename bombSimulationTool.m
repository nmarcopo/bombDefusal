function varargout = bombSimulationTool(varargin)
% BOMBSIMULATIONTOOL MATLAB code for bombSimulationTool.fig
%      BOMBSIMULATIONTOOL, by itself, creates a new BOMBSIMULATIONTOOL or raises the existing
%      singleton*.
%
%      H = BOMBSIMULATIONTOOL returns the handle to a new BOMBSIMULATIONTOOL or the handle to
%      the existing singleton*.
%
%      BOMBSIMULATIONTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOMBSIMULATIONTOOL.M with the given input arguments.
%
%      BOMBSIMULATIONTOOL('Property','Value',...) creates a new BOMBSIMULATIONTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bombSimulationTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bombSimulationTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bombSimulationTool

% Last Modified by GUIDE v2.5 20-Apr-2017 22:51:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @bombSimulationTool_OpeningFcn, ...
    'gui_OutputFcn',  @bombSimulationTool_OutputFcn, ...
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


% --- Executes just before bombSimulationTool is made visible.
function bombSimulationTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bombSimulationTool (see VARARGIN)

% Choose default command line output for bombSimulationTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bombSimulationTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
grid(handles.resultAxes,'on');
ylabel('Simulated time to complete task (s)');
set(gca,'xticklabel',{'Wires','Switches','Buttons','Numpad','Total Time'});


% --- Outputs from this function are returned to the command line.
function varargout = bombSimulationTool_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numBombs_Callback(hObject, eventdata, handles)
% hObject    handle to numBombs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numBombs as text
%        str2double(get(hObject,'String')) returns contents of numBombs as a double


% --- Executes during object creation, after setting all properties.
function numBombs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numBombs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[attempts,simtime] = runSimulation(handles);



function dtText_Callback(hObject, eventdata, handles)
% hObject    handle to dtText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dtText as text
%        str2double(get(hObject,'String')) returns contents of dtText as a double


% --- Executes during object creation, after setting all properties.
function dtText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('tempSimData');
loadData(attempts,simtime,loop,handles,timeperpanel,compTime);
save('simData','attempts','simtime','timeperpanel','compTime');


% --- Executes on button press in start2Button.
function start2Button_Callback(hObject, eventdata, handles)
% hObject    handle to start2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[attempts,simtime] = runSimulation(handles);


% --- Executes during object deletion, before destroying properties.
function timeTable_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to timeTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
