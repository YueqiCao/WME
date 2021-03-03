function WME_draw_points(X,varargin)

dim = length(X(1,:));
inputPara = varargin;

% set colormap
mycolor = acc_colormap('cmo_thermal');
colormap(mycolor);

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
        view(-45,60)

        inputLength = length(inputPara);
            while inputLength >= 2
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
                    case 'MarkerSize'
                        h.SizeData = value;
                    case 'Alpha'
                        h.AlphaData = value;
                end
            end
    case 2
        figure;
        h = scatter2(X(:,1), X(:,2), 'filled');
        h.CDataMode = 'manual';
        h.CData = X(:,2);
        h.SizeData = 12;
        grid off
        axis off
        axis tight

        inputLength = length(inputPara);
            while inputLength >= 2
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
                    case 'MarkerSize'
                        h.SizeData = value;
                    case 'Alpha'
                        h.AlphaData = value;
                end
            end
    otherwise
        error('Invalid input point cloud');
end

f = gcf;
figtitle = datestr(datetime,'yyyy-mm-dd-HH-MM');
exportgraphics(f,[figtitle,'.pdf'],'BackgroundColor','none');
