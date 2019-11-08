% @param image3D imagen tridimencional que se usa para exportar las im�genes binarias
% @param dest ruta destino de las im�genes generadas
%
function [  ] = exportSkeleton(image3D, dest)
    % Se itera sobre la tercera dimensi�n de la imagen tridimencional, es
    % decir, existen las dimensiones X, Y, y Z, entonces se itera sobre Z.
    for i = 1: size(image3D, 3)
        currentImg = image3D(:, :, i);
        % Para un correcto nombramiento de archivos, se hace una peque�a
        % validaci�n, esto con el fin de seguir un patr�n de numeraci�n,
        % ejemplo: 001.tiff, 002.tiff, ..., 010.tiff, 011.tiff, ...,
        % 100.tiff, 101.tiff
        
        %var fn almacena el nombre temporal de la imagen que se almacenar� en el directorio especificado en los par�metros
        if i < 10
            fn = sprintf('00%d.tiff', i);
            % Se guarda la imagen en la posici�n actual de la dimensi�n Z,
            % considerando todos los renglones y todas las columnas, el
            % nombre se consigue mediante la concatenaci�n de la ruta
            % especificada en los par�metros y el nombre temporal de la
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