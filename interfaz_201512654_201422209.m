function varargout = interfaz_201512654_201422209(varargin)
% INTERFAZ_201512654_201422209 MATLAB code for interfaz_201512654_201422209.fig
%      INTERFAZ_201512654_201422209, by itself, creates a new INTERFAZ_201512654_201422209 or raises the existing
%      singleton*.
%
%      H = INTERFAZ_201512654_201422209 returns the handle to a new INTERFAZ_201512654_201422209 or the handle to
%      the existing singleton*.
%
%      INTERFAZ_201512654_201422209('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ_201512654_201422209.M with the given input arguments.
%
%      INTERFAZ_201512654_201422209('Property','Value',...) creates a new INTERFAZ_201512654_201422209 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_201512654_201422209_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_201512654_201422209_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz_201512654_201422209

% Last Modified by GUIDE v2.5 15-Apr-2018 18:19:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_201512654_201422209_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_201512654_201422209_OutputFcn, ...
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



% --- Executes just before interfaz_201512654_201422209 is made visible.
function interfaz_201512654_201422209_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz_201512654_201422209 (see VARARGIN)

% Choose default command line output for interfaz_201512654_201422209
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% initialize table
tableFileID = fopen('table2.dat','r');
formatSpec = '%q %q %s %s %s %s %s\n';
datacell = textscan(tableFileID,formatSpec);
fclose(tableFileID);
disp('------- datacell------');
disp(datacell);
newTable = {};
dataCellDims = size(datacell);
nCols = dataCellDims(2);
temp = -1;
nRows = 0;
if nCols > 0
    temp = datacell{1};
    dim = size(temp);
    nRows = dim(1);
end
for row  = 1:nRows
    for col = 1:nCols
        if col > 3
            newTable{row, col} = str2double(datacell{col}{row});
        else
            newTable{row, col} = datacell{col}{row};
        end
    end
end
setappdata(0,'table',newTable);
set(handles.uitable1,'Data',newTable);

% UIWAIT makes interfaz_201512654_201422209 wait for user response (see UIRESUME)
%uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = interfaz_201512654_201422209_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAgregar.
function pbAgregar_Callback(hObject, eventdata, handles)
% hObject    handle to pbAgregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nuevoEstudiante


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in pbEliminar.
function pbEliminar_Callback(hObject, eventdata, handles)
% hObject    handle to pbEliminar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
eliminarEstudiante


% --- Executes on button press in pushbuttonEditar.
function pushbuttonEditar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonEditar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbCalcularPromedio.
function pbCalcularPromedio_Callback(hObject, eventdata, handles)
% hObject    handle to pbCalcularPromedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentTable = getappdata(0, 'table');
dims = size(currentTable);
nRows = dims(1);
for row  = 1:nRows
    currentTable{row, 7} = 0.6 * currentTable{row,4} + 0.25 * currentTable{row, 5} + 0.15 * currentTable{row, 6};
end
disp(currentTable);
setappdata(0, 'table', currentTable);
set(handles.uitable1,'Data',currentTable);

% --- Executes on button press in pbHistograma.
function pbHistograma_Callback(hObject, eventdata, handles)
% hObject    handle to pbHistograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentTable = getappdata(0, 'table');
colGrades=cell2mat(currentTable(:,7));
figure(1);
edges = 0:0.5:5;
histogram(colGrades, edges);
set(gca,'Color',[0.72,0.63,0.9]);
xlabel('Rango de Notas');
ylabel('Ocurrencias por Rango');
title('Histograma de Notas Finales');




% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
indicesRecord = eventdata.Indices;
disp(indicesRecord);
disp('Edit data');
disp(class(eventdata.EditData));
disp(eventdata.EditData);
disp('New data');
disp(class(eventdata.NewData));
disp(eventdata.NewData);
disp('tipo de indeces'), disp(class(indicesRecord));
disp('------- edited data, not real table---------');
disp(get(hObject, 'Data'));
disp('------- edited data, not real table---------');
editedData = get(hObject, 'Data');

setappdata(0,'table', editedData);


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
x=getappdata(0,'table');
disp('------ create--------');
disp(x);
disp('------ create--------');
set(hObject,'Data',x);

% --- Executes during object creation, after setting all properties.
function panel_fondo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panel_fondo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pbRefrescar.
function pbRefrescar_Callback(hObject, eventdata, handles)
% hObject    handle to pbRefrescar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=getappdata(0,'table');
disp('------ reload--------');
disp(x);
disp('------ reload--------');
set(handles.uitable1,'Data',x);


% --- Executes on button press in pbGuardarTabla.
function pbGuardarTabla_Callback(hObject, eventdata, handles)
% hObject    handle to pbGuardarTabla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tableToSave = getappdata(0, 'table');
sizeOfTable = size(tableToSave);
numberOfRows = sizeOfTable(1);
numberOfCols = sizeOfTable(2);
fileID = fopen('table2.dat', 'w');
formatSpec = '\"%s\" \"%s\" %s %f %f %f %f\n';
for row = 1:numberOfRows
    fprintf(fileID, formatSpec, tableToSave{row,:});
end
fclose(fileID);
msgbox('el archivo ha sido guardado satisfactoriamente');
