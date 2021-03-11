%% WME_tangent_spaces
% Estimate the tangent spaces and normal spaces for submanifold point
% cloud X by local PCA.
%
% point cloud X is an N*totDim matrix where totDim is the total dimension 
% of Euclidean space and N is the number of sampled points. 
%
% [tgtBasis, nomBasis] = WME_tangent_spaces(X,intDim) produces a 
% totDim * intDIm * N matrix tgtBasis where for each i, tgtBasis(:,:,i) 
% consists of orthonormal basis for the tangent space at X(i,:), 
% and a totDim * (totDim-intDim) * N matrix nomBasis where for each
% i, nomBasis(:,:,i) consists of orthonormal basis for the normal space at
% X(i,:)
%
% [tgtBasis, nomBasis] = WME_tangent_spaces(X,intDim,'kNN',K) specifies 
% the kNN parameter K when using local PCA. The default value is set to be
% totDim*log(N).
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function [tgtBasis, nomBasis] = WME_tangent_spaces(X,intDim,varargin)

% set dimension

[N,totDim] = size(X);
fprintf('The point cloud consists of %d points sampled from %d dim submanifold in %d dim Euclidean space\n', ...
        N,intDim,totDim);

tgtBasis = zeros(totDim,intDim,N);
nomBasis = zeros(totDim,totDim-intDim,N);

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

% estimate basis

for i = 1:N
    S = X(IDX(i,:),:);
    S = S-ones(K+1,1)*S(1,:);
    S(1,:)=[];
    [U,L,V] = svd(S,'econ');
    singValues = diag(L);
    [singValues, IndX] = sort(singValues,'descend');
    V = V(IndX);
    ratio = sum(singValues(1:intDim))/sum(singValues);
    if  ratio < 0.7
        warning('may improve intrinsic dimension estimation, ratio = %.2f', ratio);
    end
    tgtBasis(:,:,i) = V(:,1:intDim);
    nomBasis(:,:,i) = V(:,intDim+1:totDim);
end % end of for


   
