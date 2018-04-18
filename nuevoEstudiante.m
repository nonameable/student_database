function varargout = nuevoEstudiante(varargin)
% NUEVOESTUDIANTE MATLAB code for nuevoEstudiante.fig
%      NUEVOESTUDIANTE, by itself, creates a new NUEVOESTUDIANTE or raises the existing
%      singleton*.
%
%      H = NUEVOESTUDIANTE returns the handle to a new NUEVOESTUDIANTE or the handle to
%      the existing singleton*.
%
%      NUEVOESTUDIANTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUEVOESTUDIANTE.M with the given input arguments.
%
%      NUEVOESTUDIANTE('Property','Value',...) creates a new NUEVOESTUDIANTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nuevoEstudiante_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nuevoEstudiante_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nuevoEstudiante

% Last Modified by GUIDE v2.5 15-Apr-2018 10:58:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nuevoEstudiante_OpeningFcn, ...
                   'gui_OutputFcn',  @nuevoEstudiante_OutputFcn, ...
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


% --- Executes just before nuevoEstudiante is made visible.
function nuevoEstudiante_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nuevoEstudiante (see VARARGIN)

% Choose default command line output for nuevoEstudiante
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nuevoEstudiante wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nuevoEstudiante_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAgregarEstudiante.
function pbAgregarEstudiante_Callback(hObject, eventdata, handles)
% hObject    handle to pbAgregarEstudiante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentTable = getappdata(0, 'table');
sizeOfTable = size(currentTable);
numberOfStudents = sizeOfTable(1);
numberOfColumns = sizeOfTable(2); 
newStudentRowIndex = numberOfStudents + 1;
currentTable{newStudentRowIndex,numberOfColumns} = [];

name = get(handles.editNombre, 'String');
lastName = get(handles.editApellido, 'String');
code = get(handles.editCodigo, 'String');
examGrade = str2double(get(handles.editParciales, 'String'));
labgrade = str2double(get(handles.editLaboratorio, 'String'));
labProject = str2double(get(handles.editProyecto, 'String'));
emptyFields1 = isempty(name) || isempty(lastName) || isempty(code);
emptyFields2 = isempty(get(handles.editParciales, 'String')) || isempty(get(handles.editLaboratorio, 'String')) || isempty(get(handles.editProyecto, 'String'));
if emptyFields1 || emptyFields2 
    msgbox('rellene los campos faltantes');
else
   currentTable{newStudentRowIndex, 1} = name;
    currentTable{newStudentRowIndex, 2} = lastName;
    currentTable{newStudentRowIndex, 3} = code;
    currentTable{newStudentRowIndex, 4} = examGrade;
    currentTable{newStudentRowIndex, 5} = labgrade;
    currentTable{newStudentRowIndex, 6} = labProject;
    currentTable{newStudentRowIndex, 7} = 0;
    setappdata(0,'table',currentTable);
    close(nuevoEstudiante); 
end




 


function editNombre_Callback(hObject, eventdata, handles)
% hObject    handle to editNombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNombre as text
%        str2double(get(hObject,'String')) returns contents of editNombre as a double


% --- Executes during object creation, after setting all properties.
function editNombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLaboratorio_Callback(hObject, eventdata, handles)
% hObject    handle to editLaboratorio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLaboratorio as text
%        str2double(get(hObject,'String')) returns contents of editLaboratorio as a double


% --- Executes during object creation, after setting all properties.
function editLaboratorio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLaboratorio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editProyecto_Callback(hObject, eventdata, handles)
% hObject    handle to editProyecto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editProyecto as text
%        str2double(get(hObject,'String')) returns contents of editProyecto as a double


% --- Executes during object creation, after setting all properties.
function editProyecto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editProyecto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editApellido_Callback(hObject, eventdata, handles)
% hObject    handle to editApellido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editApellido as text
%        str2double(get(hObject,'String')) returns contents of editApellido as a double


% --- Executes during object creation, after setting all properties.
function editApellido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editApellido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function editParciales_Callback(hObject, eventdata, handles)
% hObject    handle to editParciales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editParciales as text
%        str2double(get(hObject,'String')) returns contents of editParciales as a double


% --- Executes during object creation, after setting all properties.
function editParciales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editParciales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
