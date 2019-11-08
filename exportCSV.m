% @param P patr�n para identificar un formato en espec�fico (.tiff, .jpeg, .jpg, .png, etc.)
% @param dir directorio con im�genes binarias
% @param dest ruta destino del archivo CSV
% @param fn nombre del archivo CSV
%
function [ CSV ] = exportCSV(P, dir, dest, fn)
    % Se abre el archivo de texto indicado en los par�metros, de existir el
    % archivo, su contenido ser� sobrescrito, en caso de no existir, el
    % archivo ser� creado y se agregar� el contenido generado.
    CSV = fopen(strcat(strcat(dest, fn), '.csv'), 'w');
    
    for slice = 1: numel(P)
        % @var num slice iterador/contador de las im�genes del directorio
        % @var str fileName nombre de la imagen en la posici�n que indica el iterador
        % @var mat thisSlice imagen le�ada bas�ndose en la variable fileName
        fileName = fullfile(dir, P(slice).name);
        thisSlice = imread(fileName);
        
        % Se itera sobre la imagen actual para detectar los puntos de
        % inter�s, es decir, los puntos con un valor mayor a 0.
        for i = 1: size(thisSlice, 1)
            for j = 1: size(thisSlice, 2)
                if thisSlice(i, j) > 0
                    % Impresi�n del arreglo de objetos, 
                    fprintf(CSV, '%d,%d,%d\n', i, j, slice);
                end
            end
        end
    end
    
    % Se cierra el archivo que se abri� al inicio de la funci�n.
    fclose(CSV);
end