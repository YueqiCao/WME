%% WME_draw_points
% visualize point clouds using scatter(scatter3) function
%
% WME_draw_points(X) displays points at locations specified by the row
% vectors of X. Inline functions scatter/scatter3 are used according to
% the row dimension of X. Default color is given by the last coordinates.
%
% WME_draw_points(X, ...) displays points while showing properties
% specified by various (unordered) inputs: 
% 
% 'curv': followed by a column vector with the same size as the columns of
% X. The points are then colored according to the vector.
%
% 'enhanced': same as 'curv' but the contrast of color is improved.
%
% 'view': followed by [az, el]. Adjust the view of figure.
%
% 'colormap': followed by a string specifying the colormap in
% matlab_colormaps-master file.
%
% 'save': followed by a string representing the title and type of the image
% you want to save. Matlab version should be 2020 or higher.
%
% Example:
% 
% [X, nom, gauss, mean] = WME_torus(1e4, 5, 2);
% WME_draw_points(X,'curv',gauss,'save','example.pdf');
%
% See also scatter, scatter3, exportgraphics
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function WME_draw_points(X,varargin)

dim = length(X(1,:));
inputPara = varargin;

switch dim
    case 3
        figure;
        h = scatter3(X(:,1), X(:,2), X(:,3), 'filled');
        h.CDataMode = 'manual';
        h.CData = X(:,3);
        h.SizeData = 12;
        grid off
        axis off
        axis tight
        mycolor = acc_colormap('cmo_thermal');
        colormap(mycolor);
        colorbarh = colorbar;
        colorbarh.Ruler.TickLabelFormat = '%.1f';
        view(-45,60)

        while length(inputPara) >= 2
            state = inputPara{1};
            value = inputPara{2};
            inputPara = inputPara(3:end);
            switch state
                case 'curv'
                    h.CData = value;
                case 'enhanced'
                    CMax = max(value);
                    CMin = min(value);
                    interval = CMax - CMin;
                    value(value > CMin+3/4*interval) = CMax;
                    value(value < CMin+1/4*interval) = CMin;
                    h.CData = value;
                case 'markerSize'
                    h.SizeData = value;
                case 'alpha'
                    h.AlphaData = value;
                case 'view'
                    view(value);
                case 'colormap'
                    mycolor = acc_colormap(value);
                    colormap(mycolor);
                case 'save'
                    f = gcf;
                    exportgraphics(f,value,'BackgroundColor','none');
            end
        end
    case 2
        figure;
        h = scatter(X(:,1), X(:,2), 'filled');
        h.CDataMode = 'manual';
        h.CData = X(:,2);
        h.SizeData = 12;
        grid off
        axis off
        axis tight
        mycolor = acc_colormap('cmo_thermal');
        colormap(mycolor);
        colorbarh = colorbar;
        colorbarh.Ruler.TickLabelFormat = '%.1f';

        while length(inputPara) >= 2
            state = inputPara{1};
            value = inputPara{2};
            inputPara = inputPara(3:end);
            switch state
                case 'curv'
                    h.CData = value;
                case 'enhanced'
                    CMax = max(value);
                    CMin = min(value);
                    interval = CMax - CMin;
                    value(value > CMin+3/4*interval) = CMax;
                    value(value < CMin+1/4*interval) = CMin;
                    h.CData = value;
                case 'markerSize'
                    h.SizeData = value;
                case 'alpha'
                    h.AlphaData = value;
                case 'colormap'
                    mycolor = acc_colormap(value);
                    colormap(mycolor);
                case 'save'
                    f = gcf;
                    exportgraphics(f,value,'BackgroundColor','none');
            end
        end
    otherwise
        error('Invalid input point cloud');
end

