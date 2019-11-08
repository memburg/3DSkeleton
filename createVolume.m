% @param P patr�n para identificar un formato en espec�fico (.tiff, .jpeg, .jpg, .png, etc.)
% @param dir directorio del cual se utilizan las im�genes binarias
%
function [ image3D ] = createVolume(P, dir)
    for slice = 1: numel(P)
        % @var num slice iterador/contador de las im�genes del directorio
        % @var str fileName nombre de la imagen en la posici�n que indica el iterador
        % @var mat thisSlice imagen le�ada bas�ndose en la variable fileName
        % @var str image3D es el volumen creado a partir del set de im�genes
        fileName = fullfile(dir, P(slice).name);
        thisSlice = imread(fileName);

        % Se crea la variable image3D en caso de tratarse de la primera imagen
        % del directorio, de lo contrario, al ya estar creada la variable
        % image3D, se concatena la imagen actual (thisSlice) con lo que ya 
        % se ha almacenado en image3D.
        if slice == 1
            image3D = thisSlice;
        else
            image3D = cat(3, image3D, thisSlice);
        end
    end
end