%% WME_tangent_spaces
% Estimate the tangent spaces and normal spaces for submanifold point
% cloud X using local PCA.
%
%% Syntax
% 
% * |[tgtBasis, nomBasis] = WME_tangent_spaces(X, intDim)|
% * |[tgtBasis, nomBasis] = WME_tangent_spaces(X, intDim, 'kNN', K)|
%
%% Description
%
% * |[tgtBasis, nomBasis] = WME_tangent_spaces(X, intDim)| produces a 
% |totDim * intDIm * N| matrix |tgtBasis| where for each i, |tgtBasis(:,:,i)| 
% consists of orthonormal basis for the tangent space at |X(i,:)|, 
% and a |totDim * (totDim-intDim) * N| matrix |nomBasis| where for each
% i, |nomBasis(:,:,i)| consists of orthonormal basis for the normal space at
% |X(i,:)|. Point cloud |X| is an |N*totDim| matrix where |totDim| is the total dimension 
% of Euclidean space and |N| is the number of sampled points
% 
% * |[tgtBasis, nomBasis] = WME_tangent_spaces(X, intDim, 'kNN', K)| specifies 
% the kNN parameter |K| when using local PCA. The default value is set to be
% |totDim*log(N)|
%
%% Example
X = WME_torus(1e4);
[tgtBasis, nomBasis] = WME_tangent_spaces(X, 2);
nom = zeros(1e4,3);
for i = 1:1e4
    nom(i,:) = nomBasis(:,:,i)';
end
WME_draw_points(X,'curv',X(:,3),'view',[-30,45]);
hold on
WME_draw_planes(X, nom, 'top', 'global');
hold off
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>