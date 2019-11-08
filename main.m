clc;        % limpiar consola
clear;      % borrar variables almacenadas en memoria
close all;  % cerrar ventanas abiertas

% @var str absr ruta del directorio principal
% @var str bin ruta de las imágenes (binarias) de las cuales se obtendrá el esqueleto
% @var str skel ruta en donde se almacenan las imágenes generadas a partir del esqueleto
% @var str binP patrón para encontrar imágenes con extensión .tiff en el directorio 'Binarized'
absr = 'C:\Users\Memburg\Desktop\Skel\';
bin = strcat(absr, 'Binarized\');
skel = strcat(absr, 'Skeletonized\');
binP = dir(fullfile(bin, '*.tiff'));

% Ejecución de la función createVolume para obtener el volumen a partir del
% set de imágenes.
image3D = createVolume(binP, bin);

% @var mat binVol almacena el volumen generado pero binarizado
% @var mat skeleton almacena el esqueleto generado a partir de binVol
binVol = imbinarize(image3D);
skeleton = bwskel(binVol);

% Ejecución de la función exportSkeleton para la obtensión de un set de
% imágenes binarias.
exportSkeleton(skeleton, skel);

% @var str binP patrón para encontrar imágenes con extensión .tiff en el directorio 'Skeletonized'
skelP = dir(fullfile(skel, '*.tiff'));

% Ejecución de la función exportJS para la obtención de un arreglo de
% objetos en JavaScript.
exportJS(skelP, skel, absr, 'skeleton');

% Ejecución de la función exportCSV para la obtención de un archivo de
% valores separados por comas
exportCSV(skelP, skel, absr, 'skeleton');