% @param P patrón para identificar un formato en específico (.tiff, .jpeg, .jpg, .png, etc.)
% @param dir directorio con imágenes binarias
% @param dest ruta destino del archivo CSV
% @param fn nombre del archivo CSV
%
function [ CSV ] = exportCSV(P, dir, dest, fn)
    % Se abre el archivo de texto indicado en los parámetros, de existir el
    % archivo, su contenido será sobrescrito, en caso de no existir, el
    % archivo será creado y se agregará el contenido generado.
    CSV = fopen(strcat(strcat(dest, fn), '.csv'), 'w');
    
    for slice = 1: numel(P)
        % @var num slice iterador/contador de las imágenes del directorio
        % @var str fileName nombre de la imagen en la posición que indica el iterador
        % @var mat thisSlice imagen leíada basándose en la variable fileName
        fileName = fullfile(dir, P(slice).name);
        thisSlice = imread(fileName);
        
        % Se itera sobre la imagen actual para detectar los puntos de
        % interés, es decir, los puntos con un valor mayor a 0.
        for i = 1: size(thisSlice, 1)
            for j = 1: size(thisSlice, 2)
                if thisSlice(i, j) > 0
                    % Impresión del arreglo de objetos, 
                    fprintf(CSV, '%d,%d,%d\n', i, j, slice);
                end
            end
        end
    end
    
    % Se cierra el archivo que se abrió al inicio de la función.
    fclose(CSV);
end