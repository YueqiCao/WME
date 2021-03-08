%% WME_read_data
% Read point cloud data in various data types
%
% data = WME_read_data(filetype, filename) 
%
% filetype can be 'mat', 'txt', 'ply'.
%
% Example:
% data = WME_read_data('ply', 'bunny.ply');
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function data = WME_read_data(filetype, filename)

switch filetype
    case 'mat'
        data = load(filename);
    case 'txt'
        data = load(filename);
    case 'ply'
        data = pcread(filename);
end