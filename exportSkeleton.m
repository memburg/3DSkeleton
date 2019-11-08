% @param image3D imagen tridimencional que se usa para exportar las imágenes binarias
% @param dest ruta destino de las imágenes generadas
%
function [  ] = exportSkeleton(image3D, dest)
    % Se itera sobre la tercera dimensión de la imagen tridimencional, es
    % decir, existen las dimensiones X, Y, y Z, entonces se itera sobre Z.
    for i = 1: size(image3D, 3)
        currentImg = image3D(:, :, i);
        % Para un correcto nombramiento de archivos, se hace una pequeña
        % validación, esto con el fin de seguir un patrón de numeración,
        % ejemplo: 001.tiff, 002.tiff, ..., 010.tiff, 011.tiff, ...,
        % 100.tiff, 101.tiff
        
        %var fn almacena el nombre temporal de la imagen que se almacenará en el directorio especificado en los parámetros
        if i < 10
            fn = sprintf('00%d.tiff', i);
            % Se guarda la imagen en la posición actual de la dimensión Z,
            % considerando todos los renglones y todas las columnas, el
            % nombre se consigue mediante la concatenación de la ruta
            % especificada en los parámetros y el nombre temporal de la
            % imagen.
            imwrite(currentImg, strcat(dest, fn));
        elseif i >= 10 && i < 100
            fn = sprintf('0%d.tiff', i);
            imwrite(currentImg, strcat(dest, fn));
        else
            fn = sprintf('%d.tiff', i);
            imwrite(currentImg, strcat(dest, fn));
        end
    end
end