%% WME_tangent_spaces
% Estimate the tangent spaces and normal spaces for submanifold point
% cloud X by local PCA.
%
% point cloud X is an N*d matrix where d is the total dimension of Euclidean
% space and N is the number of sampled points. m is the intrinsic dimension
% of the submanifold.
%
% [tgtBasis, nomBasis] = WME_tangent_spaces(X,m) produces a d*m*N matrix
% tgtBasis where for each i, tgtBasis(:,:,i) consists of orthonormal basis for the
% tangent space at X(i,:), and a d*(d-m)*N matrix nomBasis where for each
% i, nomBasis(:,:,i) consists of orthonormal basis for the normal space at
% X(i,:)
%
% [tgtBasis, nomBasis] = WME_tangent_spaces(X,m,'kNN',K) specifies the kNN
% parameter K when using local PCA. The default value is set to be
% d*log(N).
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function [tgtBasis, nomBasis] = WME_tangent_spaces(X,m,varargin)

[N,d] = size(X);
fprintf('The point cloud consists of %d points sampled from %d dim submanifold in %d dim Euclidean space\n', ...
        N,m,d);

tgtBasis = zeros(d,m,N);
nomBasis = zeros(d,d-m,N);

if isempty(varargin) == 0
    switch varargin{1}
        case 'kNN'
            K = varargin{2};
            [IDX,Distance]=knnsearch(X,X,'K',K+1);
            for i = 1:N
                S = X(IDX(i,:),:);
                S = S-ones(K+1,1)*S(1,:);
                S(1,:)=[];
                [U,L,V] = svd(S,'econ');
                singValues = diag(L);
                ratio = sum(singValues(1:m))/sum(singValues);
                if  ratio < 0.7
                    warning('may improve intrinsic dimension estimation, ratio = %.2f', ratio);
                end
                tgtBasis(:,:,i) = V(:,1:m);
                nomBasis(:,:,i) = V(:,m+1:d);
            end % end of for
        case 'kernel'
            error('please use kNN');
        otherwise
            error('wrong input format!');
    end % end of switch
else
    defaultK = max(20,d*log10(N));
    [IDX,Distance]=knnsearch(X,X,'K',defaultK+1);
    for i = 1:N
    S = X(IDX(i,:),:);
    S = S-ones(defaultK+1,1)*S(1,:);
    S(1,:)=[];
    [U,L,V] = svd(S,'econ');
    singValues = diag(L);
    ratio = sum(singValues(1:m))/sum(singValues);
        if  ratio < 0.7
            warning('may improve intrinsic dimension estimation, ratio = %.2f', ratio);
        end
    tgtBasis(:,:,i) = V(:,1:m);
    nomBasis(:,:,i) = V(:,m+1:d);
    end % end of for
end
