%% WME_draw_planes
% draw tangent planes on point clouds
%
% WME_draw_planes(X, nom, position, size) draw tangent plane at the point
% specified by position:
% 'top': point with largest z-coordinate;
% 'bottom': point with smallest z-coordinate;
% 'random': select a random point
% natural number n: nth point in the point cloud X. ...
% the size of the plane is:
% 'global': the size is set to be the same as point cloud X;
% 'local': the plane is concentrated at position.
%
% WME_draw_planes(X, nom, position, size, ...)
% available properties are:
% 
% 'alpha': transparency of the tangent plane
%
% 'showNormal': present normal directions using quiver3. Input parameter
% specifies the scaling of normal vector
%
% 'save': followed by a string representing the title and type of the image
% you want to save. Matlab version should be 2020 or higher.
%
% Example:
% [X, nom, gaussCurv] = WME_torus(1e4, 5, 2);
% WME_draw_points(X,'curv',gaussCurv,'view',[-45,30]);
% hold on
% [~, indx] = sort(X(:,3));
% for i = 1:10
%    position = indx(end-i);
%    WME_draw_planes(X, nom, position, 'local', 'showNormal', 1.5);
% end
% hold off
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function WME_draw_planes(X, nom, position, size, varargin)

% specify pass point

[~, indx] = sort(X(:,3)); 

switch position
    case 'top'
        at = indx(end);
    case 'bottom'
        at = indx(1);
    case 'random'
        at = unidrnd(length(indx));
    otherwise
        at = position;
end

pass = X(at, :);
direct = nom(at, :);
A = direct(1); B = direct(2); C = direct(3);
D = -pass*direct';

% patch a plane

switch size
    case 'global'
        xLim = [min(X(:,1)), max(X(:,1))];
        yLim = [min(X(:,2)), max(X(:,2))];
    case 'local'
        xWidth = 1/10*(max(X(:,1))-min(X(:,1)));
        yWidth = 1/10*(max(X(:,2))-min(X(:,2)));
        xLim = [pass(1)-xWidth, pass(1)+xWidth];
        yLim = [pass(2)-yWidth, pass(2)+yWidth];
end

xCoor = [xLim(1), xLim(1), xLim(2), xLim(2)]';
yCoor = [yLim(1), yLim(2), yLim(2), yLim(1)]';
zCoor = -1/C * (A*xCoor+B*yCoor+D*ones(4,1));
p = patch(xCoor,yCoor,zCoor,'b');

p.EdgeAlpha = 0;
p.FaceAlpha = 0.5;
p.FaceLighting = 'gouraud';


% adjust patch parameter

inputPara = varargin;

while length(inputPara) >= 2
    state = inputPara{1};
    value = inputPara{2};
    inputPara = inputPara(3:end);
    switch state
        case 'alpha'
            p.FaceAlpha = value;
        case 'showNormal'
            hold on
            quiver3(pass(1),pass(2),pass(3),A,B,C,value,...
                'r','LineWidth',2,'MaxHeadSize',1,'showArrowHead','on');
        case 'save'
            f = gcf;
            exportgraphics(f,value,'BackgroundColor','none');
        otherwise
            error('Invalid Input')
    end 
end