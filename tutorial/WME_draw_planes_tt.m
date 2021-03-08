%% WME_draw_planes
% Draw tangent planes on point clouds
%
%% Syntax
% 
% * |WME_draw_planes(X, nom, position, size)|
% * |WME_draw_planes(..., name, value)|
%
%% Description
% * |WME_draw_planes(X, nom, position, size)| draw a tangent plane at the point
% specified by |position|:
% * - 'top': point with largest z-coordinate
% * - 'bottom': point with smallest z-coordinate
% * - 'random': select a random point
% * - natural number n: nth point in the point cloud X
% * the |size| of the plane is:
% * - 'global': the plane is set to be the same as the point cloud X
% * - 'local': the plane is concentrated at position.
%
% * |WME_draw_planes(..., name, value)| draw tangent planes with properties
% specified by name-value. Available properties are: 
% * - 'alpha': transparency of the tangent plane
% * - 'showNormal': present normal directions using quiver3. Input parameter
% specifies the scaling of normal vector
% * - 'save': followed by a string representing the title and type of the image
% you want to save. Matlab version should be 2020 or higher.
%
%% Example
[X, nom, gaussCurv] = WME_torus(1e4, 5, 2);
WME_draw_points(X,'curv',gaussCurv,'view',[-45,30]);
hold on
[~, indx] = sort(X(:,3));
for i = 1:10
   position = indx(end-i);
   WME_draw_planes(X, nom, position, 'local', 'showNormal', 1.5);
end
hold off
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>