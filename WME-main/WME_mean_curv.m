%% WME_mean_curv
% Estimate the mean curvature field for submanifold point cloud X
%
% meanCurvVec = WME_mean_curv(X, intDim) produces a matrix fo the same size
% as X representing the mean curvature field on X.
%
% [meanCurvVec, absMeanCurv] = WME_mean_curv(X, intDim) produces the mean
% vector field meanCurvVec and the absolute mean curvature absMeanCurv.
%
% [meanCurv, absMeanCurv] = WME_mean_curv(X, intDim, ...) specifies the
% local neighbor parameter manually:
% 
% 'PCAkNN': specifies the kNN parameter in tangent/normal spaces estimation
%
% 'LSkNN': specifies the kNN parameter in the Weingarten map estimation
%
% Example: 
%
% X = WME_torus(1e5, 5, 2);
% [meanCurvVec, absMeanCurv] = WME_mean_curv(X,2,'PCAkNN',100,'LSkNN',30);
% WME_draw_points(X,'curv',absMeanCurv,'colorbar','%.2f')
% hold on
% WME_draw_normals(X, -meanCurvVec, 'scale', 1.5,'save','mean_curv_field_on_torus.pdf')
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function varargout = WME_mean_curv(X,intDim, varargin)

[N, totDim] = size(X);
meanCurvVec = zeros(N, totDim);
absMeanCurv = zeros(N,1);

% set local neighbor parameter
K1 = max(20, totDim*log10(N));
K2 = min(20, totDim*log10(N));

inputPara = varargin;

while length(inputPara) >= 2
    state = inputPara{1};
    value = inputPara{2};
    inputPara = inputPara(3:end);
    switch state
        case 'PCAkNN'
            K1 = value;
        case 'LSkNN'
            K2 = value;
    end
end

% tangent/normal spaces estimation
[tgtBasis, nomBasis] = WME_tangent_spaces(X, intDim, 'kNN', K1);

% WME
wgtmap = WME_wgtmap(X, tgtBasis, nomBasis, 'kNN', K2);

% mean curvature vector estimation
for iPoint = 1:N
    thisVec = 0;
    for iNormal = 1:(totDim-intDim)
        thisVec = thisVec + trace(wgtmap(:,:,iNormal,iPoint))...
            *nomBasis(:,iNormal,iPoint);
    end
    thisVec = 1/intDim * thisVec;
    meanCurvVec(iPoint,:) = thisVec';
    absMeanCurv(iPoint) = norm(thisVec);
end

if nargout == 1
    varargout = meanCurvVec;
end

if nargout == 2
    varargout{1} = meanCurvVec;
    varargout{2} = absMeanCurv;
end