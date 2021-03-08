%% WME_draw_normals
% Visualize normal vector fields using quiver(quiver3) function
%
%% Syntax
%
% * |WME_draw_normals(X, nom)|
% * |WME_draw_normals(..., name, value)|
%
%% Description
%
% * |WME_draw_normals(X, nom)| displays normal vectors specified by |nom| 
% at locations specified by the row vectors of |X|. Inline functions
% quiver/quiver3 are used according to
% the row dimension of |X|. Default arrow color is blue.
%
% * |WME_draw_normals(..., name, value)| displays normal vectors while showing properties
% specified by name-value. Available properties are: 
% * - 'color': color of arrows
% * - 'scale': scaling the length of arrows 
% * - 'linewidth': width of arrows
% * - 'save': followed by a string representing the title and type of the image
% you want to save. Matlab version should be 2020 or higher.
%
%% Example 
[X, nom] = WME_torus(1e4);
WME_draw_points(X);
hold on
WME_draw_normals(X, nom);
hold off
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>