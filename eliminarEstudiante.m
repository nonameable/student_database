function varargout = eliminarEstudiante(varargin)
% ELIMINARESTUDIANTE MATLAB code for eliminarEstudiante.fig
%      ELIMINARESTUDIANTE, by itself, creates a new ELIMINARESTUDIANTE or raises the existing
%      singleton*.
%
%      H = ELIMINARESTUDIANTE returns the handle to a new ELIMINARESTUDIANTE or the handle to
%      the existing singleton*.
%
%      ELIMINARESTUDIANTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELIMINARESTUDIANTE.M with the given input arguments.
%
%      ELIMINARESTUDIANTE('Property','Value',...) creates a new ELIMINARESTUDIANTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before eliminarEstudiante_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to eliminarEstudiante_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help eliminarEstudiante

% Last Modified by GUIDE v2.5 15-Apr-2018 20:54:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @eliminarEstudiante_OpeningFcn, ...
                   'gui_OutputFcn',  @eliminarEstudiante_OutputFcn, ...
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


% --- Executes just before eliminarEstudiante is made visible.
function eliminarEstudiante_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to eliminarEstudiante (see VARARGIN)

% Choose default command line output for eliminarEstudiante
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes eliminarEstudiante wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = eliminarEstudiante_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editCodigo_Callback(hObject, eventdata, handles)
% hObject    handle to editCodigo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCodigo as text
%        str2double(get(hObject,'String')) returns contents of editCodigo as a double


% --- Executes during object creation, after setting all properties.
function editCodigo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCodigo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbEliminar.
function pbEliminar_Callback(hObject, eventdata, handles)
% hObject    handle to pbEliminar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.editCodigo, 'String'))
    msgbox('ingrese el codigo del estudiante a eliminar');
else
    codeToDelete = get(handles.editCodigo, 'String');
    disp(codeToDelete);
    currentTable = getappdata(0, 'table');
    sizeOfTable = size(currentTable);
    numberOfStudents = sizeOfTable(1);
    numberOfColumns = sizeOfTable(2);
    disp('------ current table :,3 --------');
    codes = str2double(currentTable(:,3));
    disp(codes);
    mask = codes == str2double(codeToDelete);
    location = -1;
    for i = 1:numberOfStudents
        if mask(i) == 1
            location = i;
        end
    end
    disp('para borrar');
    disp(currentTable(i, :));
    currentTable(location, :) = [];
    disp('------ delete local --------');
    disp(currentTable);
    disp('------ delete local --------');
    setappdata(0,'table',currentTable);
    disp('------ delete --------');
    currentTable = getappdata(0, 'table');
    disp(currentTable);
    disp('------ delete --------');
    close(eliminarEstudiante);
end
