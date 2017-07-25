function [cardinals,hpicoils,scalp_points] = getHPIpoints(infile)
%
% function [cardinals,hpicoils,scalp_points] = getHPIpoints(infile)
%
% infile must be either a .fif file, or a .txt file generated using
% 'show_fif'
%
% The outputs are the [x,y,z] coordinates of the HPI points in the head
% frame

%% make sure we have a .txt file to work on
if strcmp(infile(end-2:end),'txt');
    disp('.txt file detected');
    tempfile = infile;
    delLater = 0;
elseif strcmp(infile(end-2:end),'fif');
    [xx,yy] = fileparts(infile);
    tempfile = fullfile(xx,'temp.txt');
    disp(['.fif file detected; generating ' tempfile ' using /neuro/bin/util/show_fiff']);
    dos(['/neuro/bin/util/show_fiff -v ' infile ' > ' tempfile]);
    delLater = 1;
else
    error('Could not detect filetype. Please give either the full path to a .fif file, or a /txt file generated using ''show_fif''. ');
end

%% get the [x,y,z] of the HPI points
% get the cardinals
fid = fopen(tempfile);
temp = textscan(fid,'%f%s%f%f%f',3,'Delimiter',',()','HeaderLines',71);
cardinals = [temp{3},temp{4},temp{5}];

% get the hpi
fid = fopen(tempfile);
temp = textscan(fid,'%f%s%f%f%f',4,'Delimiter',',()','HeaderLines',74);
hpicoils = [temp{3},temp{4},temp{5}];

% get the scalp coordinates
fid = fopen(tempfile);
temp = textscan(fid,'%f%s%f%f%f',200,'Delimiter',',()','HeaderLines',78);
numscalpy = sum(temp{1}(:) == temp{1}(1));
scalp_points = [temp{3}(1:numscalpy),temp{4}(1:numscalpy),temp{5}(1:numscalpy)];

if delLater
    disp(['Deleting ' tempfile '.'])
    delete(tempfile)
end