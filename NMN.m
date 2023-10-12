function varargout = NMN(varargin)
% NMN MATLAB code for NMN.fig
%      NMN, by itself, creates a new NMN or raises the existing
%      singleton*.
%
%      H = NMN returns the handle to a new NMN or the handle to
%      the existing singleton*.
%
%      NMN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NMN.M with the given input arguments.
%
%      NMN('Property','Value',...) creates a new NMN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NMN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NMN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NMN

% Last Modified by GUIDE v2.5 20-May-2022 15:32:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NMN_OpeningFcn, ...
                   'gui_OutputFcn',  @NMN_OutputFcn, ...
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


% --- Executes just before NMN is made visible.
function NMN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NMN (see VARARGIN)

% Choose default command line output for NMN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NMN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NMN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in redL.
function redL_Callback(hObject, eventdata, handles)
% hObject    handle to redL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

r = handles.a;
redl=r;
redl(:,:,2:3)=0;
axes(handles.axes2);
imshow(redl);
imwrite(redl,'Red layer.jpg');


% --- Executes on button press in greenL.
function greenL_Callback(hObject, eventdata, handles)
% hObject    handle to greenL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

g = handles.a;
greenl=g;
greenl(:,:,1)=0;
greenl(:,:,3)=0;
axes(handles.axes2);
imshow(greenl);
imwrite(greenl,'Green layer.jpg');


% --- Executes on button press in blueL.
function blueL_Callback(hObject, eventdata, handles)
% hObject    handle to blueL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

b = handles.a;
bluel=b;
bluel(:,:,1)=0;
bluel(:,:,2)=0;
axes(handles.axes2);
imshow(bluel);
imwrite(bluel,'Blue layer.jpg');

% --- Executes on button press in enterImg.
function enterImg_Callback(hObject, eventdata, handles)
% hObject    handle to enterImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile('*.jpg', 'Pick an image');
name = strcat(pathname,filename);
if isequal(filename,0) || isequal(pathname,0)
    warndlg('Image is not selected');
else
    a=imread(name);
    axes(handles.axes1);
    imshow(a);
    
    handles.name=name;
    handles.a=a;
    guidata(hObject, handles);
    helpdlg('Input image is Selected');
end

% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
persistent check;
b = handles.a;

if isempty(check)
    check = 1; 
    rotate = imrotate(b,90);
else
    check = 2; 
    rotate = imrotate(b,270);
end

axes(handles.axes2);
imshow(rotate);

% --- Executes on button press in cutPart.
function cutPart_Callback(hObject, eventdata, handles)
% hObject    handle to cutPart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

c = handles.a;
cp = imcrop(c,[1150, 890, 460, 530]);
axes(handles.axes2);
imshow(cp);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

d = handles.a;
dgray = rgb2gray(d);
axes(handles.axes2);
imshow(dgray);
