clc;        % limpiar consola
clear;      % borrar variables almacenadas en memoria
close all;  % cerrar ventanas abiertas

% @var str absr ruta del directorio principal
% @var str bin ruta de las im�genes (binarias) de las cuales se obtendr� el esqueleto
% @var str skel ruta en donde se almacenan las im�genes generadas a partir del esqueleto
% @var str binP patr�n para encontrar im�genes con extensi�n .tiff en el directorio 'Binarized'
absr = 'C:\Users\Memburg\Desktop\Skel\';
bin = strcat(absr, 'Binarized\');
skel = strcat(absr, 'Skeletonized\');
binP = dir(fullfile(bin, '*.tiff'));

% Ejecuci�n de la funci�n createVolume para obtener el volumen a partir del
% set de im�genes.
image3D = createVolume(binP, bin);

% @var mat binVol almacena el volumen generado pero binarizado
% @var mat skeleton almacena el esqueleto generado a partir de binVol
binVol = imbinarize(image3D);
skeleton = bwskel(binVol);

% Ejecuci�n de la funci�n exportSkeleton para la obtensi�n de un set de
% im�genes binarias.
exportSkeleton(skeleton, skel);

% @var str binP patr�n para encontrar im�genes con extensi�n .tiff en el directorio 'Skeletonized'
skelP = dir(fullfile(skel, '*.tiff'));

% Ejecuci�n de la funci�n exportJS para la obtenci�n de un arreglo de
% objetos en JavaScript.
exportJS(skelP, skel, absr, 'skeleton');

% Ejecuci�n de la funci�n exportCSV para la obtenci�n de un archivo de
% valores separados por comas
exportCSV(skelP, skel, absr, 'skeleton');