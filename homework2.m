function varargout = homework2(varargin)
% HOMEWORK2 MATLAB code for homework2.fig
%      HOMEWORK2, by itself, creates a new HOMEWORK2 or raises the existing
%      singleton*.
%
%      H = HOMEWORK2 returns the handle to a new HOMEWORK2 or the handle to
%      the existing singleton*.
%
%      HOMEWORK2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK2.M with the given input arguments.
%
%      HOMEWORK2('Property','Value',...) creates a new HOMEWORK2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework2

% Last Modified by GUIDE v2.5 09-Jan-2022 13:28:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homework2_OpeningFcn, ...
                   'gui_OutputFcn',  @homework2_OutputFcn, ...
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


% --- Executes just before homework2 is made visible.
function homework2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework2 (see VARARGIN)

% Choose default command line output for homework2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.text4,'string','A:0');
set(handles.text5,'string','B:0');
set(handles.text6,'string','100');
set(handles.text7,'string','100');



% --- Outputs from this function are returned to the command line.
function varargout = homework2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=get(handles.slider1,'value')
b = get(handles.slider2, 'Value');
%c=int16(a+b);s1='A+B';s2=num2str(c);s3=strcat(s1,s2);
set(handles.text2, 'String',['A+B=',num2str(int16(a+b))]);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=get(handles.slider1,'value')
b = get(handles.slider2, 'Value');
%c=int16(a+b);s1='A+B';s2=num2str(c);s3=strcat(s1,s2);
set(handles.text2, 'String',['A+B=',num2str(int16(a+b))]);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
