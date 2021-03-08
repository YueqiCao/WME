%% WME_draw_normals
% Visualize normal vector fields using quiver(quiver3) function
%
% WME_draw_normals(X, nom) displays normal vectors specified by nom 
% at locations specified by the row vectors of X. Inline functions
% quiver/quiver3 are used according to
% the row dimension of X. Default arrow color is blue.
%
% WME_draw_normals(X, nom, ...) displays normal vectors while showing properties
% specified by various (unordered) inputs: 
% 
% 'color': color of arrows.
%
% 'scale': scaling the length of arrow. 
%
% 'linewidth': width of arrows.
%
% 'save': followed by a string representing the title and type of the image
% you want to save. Matlab version should be 2020 or higher.
%
% Example:
% 
% [X, nom] = WME_torus(1e4);
% WME_draw_points(X);
% hold on
% WME_draw_normals(X, nom);
%
% See also quiver, quiver3, exportgraphics
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function WME_draw_normals(X, nom, varargin)

dim = length(X(1,:));
inputPara = varargin;

switch dim
    case 3
        h = quiver3(X(:,1), X(:,2), X(:,3), nom(:,1), nom(:,2), nom(:,3));
        h.Color = 'b';
        h.AutoScaleFactor = 1.5;
        h.LineWidth = 0.75;
        h.AlignVertexCenters = 'on';
        axis equal % tight axis will show stretched normals

        while length(inputPara) >= 2
            state = inputPara{1};
            value = inputPara{2};
            inputPara = inputPara(3:end);
            switch state
                case 'color'
                    h.Color = value;
                case 'scale'
                    h.AutoScaleFactor = value;
                case 'linewidth'
                    h.LineWidth = value;
                case 'marker'
                    h.Marker = value;
                case 'markerSize'
                    h.MarkerSize = value;
                case 'markerColor'
                    h.MarkerFaceColor = value;
                case 'save'
                    f = gcf;
                    exportgraphics(f,value,'BackgroundColor','none');
            end
        end
    case 2
        h = quiver(X(:,1), X(:,2), nom(:,1), nom(:,2));
        h.Color = 'b';
        h.AutoScaleFactor = 1.5;
        h.LineWidth = 0.75;
        h.AlignVertexCenters = 'on';
        axis equal

        while length(inputPara) >= 2
            state = inputPara{1};
            value = inputPara{2};
            inputPara = inputPara(3:end);
            switch state
                case 'color'
                    h.Color = value;
                case 'scale'
                    h.AutoScaleFactor = value;
                case 'linewidth'
                    h.LineWidth = value;
                case 'marker'
                    h.Marker = value;
                case 'markerSize'
                    h.MarkerSize = value;
                case 'markerColor'
                    h.MarkerFaceColor = value;                    
                case 'save'
                    f = gcf;
                    exportgraphics(f,value,'BackgroundColor','none');
            end
        end
    otherwise
        error('Invalid input point cloud');
end
