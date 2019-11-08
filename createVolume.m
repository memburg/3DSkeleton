% @param P patrón para identificar un formato en específico (.tiff, .jpeg, .jpg, .png, etc.)
% @param dir directorio del cual se utilizan las imágenes binarias
%
function [ image3D ] = createVolume(P, dir)
    for slice = 1: numel(P)
        % @var num slice iterador/contador de las imágenes del directorio
        % @var str fileName nombre de la imagen en la posición que indica el iterador
        % @var mat thisSlice imagen leíada basándose en la variable fileName
        % @var str image3D es el volumen creado a partir del set de imágenes
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