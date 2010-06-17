function varargout = line(varargin)
% LINE M-file for line.fig
%      LINE, by itself, creates a new LINE or raises the existing
%      singleton*.
%
%      H = LINE returns the handle to a new LINE or the handle to
%      the existing singleton*.
%
%      LINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINE.M with the given input arguments.
%
%      LINE('Property','Value',...) creates a new LINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before line_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to line_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help line

% Last Modified by GUIDE v2.5 19-May-2010 16:31:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @line_OpeningFcn, ...
                   'gui_OutputFcn',  @line_OutputFcn, ...
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


% --- Executes just before line is made visible.
function line_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to line (see VARARGIN)

plot(handles.axes1, sawtooth(1:0.1:10,0.5))
axis off

% Choose default command line output for line
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes line wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = line_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp(get(gcf,'Position'))
if strcmp(get(handles.text1, 'String'),'')
    stop(handles.t)
    coords = get(handles.t, 'UserData');
    disp(coords)
    hold all
    scatter(coords(:,1), coords(:,2));
    disp('bla')
else
    set(handles.text1, 'String','');
    handles.t = timer('Period',0.01, 'ExecutionMode', 'fixedRate');
    handles.t.TimerFcn = {@timerCallback, handles};
    start(handles.t)
end
guidata(hObject, handles);

