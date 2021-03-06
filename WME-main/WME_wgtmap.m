%% WME_wgtmap
% Estimate the Weingarten maps for submanifold point cloud X 
%
% require tangent/normal spaces estimation first
%
% wgtmap = WME_wgtmap(X, tgtBasis, nomBasis) produces a 4-dimensional
% matrix of size intDim*intDim*nomDim*N, where intDim is the intrinsic
% dimension of submanifold, nomDim is the codimension of embedding, N is
% the number of points. wgtmap(:,:,i,j) is a symmetric matrix representing
% the Weingarten map at point X(j,:) along the normal direction nom(:,i,j).
%
% wgtmap = WME_wgtmap(X, tgtBasis, nomBasis, 'kNN', K) specifies the kNN 
% parameter K. The default value is set to be totDim*log(N)
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function wgtmap = WME_wgtmap(X, tgtBasis, nomBasis, varargin)

% set dimension

[N, totDim] = size(X);
[~, intDim, ~] = size(tgtBasis);
[~, nomDim, ~] = size(nomBasis);
wgtmap = zeros(intDim, intDim, nomDim, N);

% set local neighbor parameters

if isempty(varargin) == 0
    switch varargin{1}
        case 'kNN'
            K = varargin{2};
            [IDX,Distance]=knnsearch(X,X,'K',K+1);
        case 'kernel'
            error('please use kNN');
        otherwise
            error('wrong input format!');
    end % end of switch
else
    K = max(20,totDim*log10(N));
    [IDX,Distance]=knnsearch(X,X,'K',K+1);
end

% estimate Weingarten map at each point for each direction

for iPoint = 1:N
    for iNormal = 1:nomDim
        thisP = X(iPoint,:);
        thistgtBasis = tgtBasis(:,:,iPoint);
        thisDirect = nomBasis(:,iNormal,iPoint);
        thisNeigh = IDX(iPoint,:);
        localNum = length(thisNeigh);
        
        % normal vector extension
        
        localNomBundle = nomBasis(:,:,thisNeigh);
        extNom = zeros(localNum, totDim);
        for iLocal = 1:localNum
            proj = localNomBundle(:,:,iLocal)*localNomBundle(:,:,iLocal)' ...
                *thisDirect;
            extNom(iLocal,:) = proj';
        end % end of extension
        
        % solving least square problem
        
        diffNom = zeros(localNum-1, totDim);
        diffPos = zeros(localNum-1, totDim);
        for iLocal = 1:(localNum-1)
            diffNom(iLocal,:) = extNom(iLocal+1,:)-thisDirect';
            diffPos(iLocal,:) = X(thisNeigh(iLocal+1),:)-thisP;
        end
        diffNomProj = diffNom * thistgtBasis;
        diffPosProj = diffPos * thistgtBasis;
        A = -(diffPosProj'*diffPosProj)^(-1) * ...
            diffPosProj'*diffNomProj;
        wgtmap(:,:,iNormal,iPoint) = 1/2* (A+A'); % symmetrization
    end % end of normal directions
end % end of points