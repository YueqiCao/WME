%% WME_read_data
% Read point cloud data in various data types
%
%% Syntax
% |data = WME_read_data(filetype, filename)| 
%
%% Description
%
% |data = WME_read_data(filetype, filename)| read data in type |filetype| with name |filename|.
% |filetype| can be |'mat', 'txt', 'ply'|
%
%% Example
data = WME_read_data('ply', 'bunny.ply');
pcshow(data)
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>