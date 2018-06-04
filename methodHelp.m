function varargout = methodHelp(varargin)
% METHODHELP MATLAB code for methodHelp.fig
%      METHODHELP, by itself, creates a new METHODHELP or raises the existing
%      singleton*.
%
%      H = METHODHELP returns the handle to a new METHODHELP or the handle to
%      the existing singleton*.
%
%      METHODHELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METHODHELP.M with the given input arguments.
%
%      METHODHELP('Property','Value',...) creates a new METHODHELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before methodHelp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to methodHelp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help methodHelp

% Last Modified by GUIDE v2.5 21-Apr-2017 22:19:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @methodHelp_OpeningFcn, ...
                   'gui_OutputFcn',  @methodHelp_OutputFcn, ...
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


% --- Executes just before methodHelp is made visible.
function methodHelp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to methodHelp (see VARARGIN)

% Choose default command line output for methodHelp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes methodHelp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = methodHelp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
