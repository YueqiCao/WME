%% WME_wgtmap
% Estimate the Weingarten maps for submanifold point cloud X. Require 
% tangent/normal spaces estimation first
%
%% Syntax
%
% * |wgtmap = WME_wgtmap(X, tgtBasis, nomBasis)| 
% * |wgtmap = WME_wgtmap(..., 'kNN', K)|
%
%% Description
%
% * |wgtmap = WME_wgtmap(X, tgtBasis, nomBasis)| produces a 4-dimensional
% matrix of size |intDim*intDim*nomDim*N|, where |intDim| is the intrinsic
% dimension of the submanifold, |nomDim| is the codimension of embedding, |N| is
% the number of points. |wgtmap(:,:,i,j)| is a symmetric matrix representing
% the Weingarten map at point |X(j,:)| along the normal direction |nom(:,i,j)|
%
% * |wgtmap = WME_wgtmap(..., 'kNN', K)| specifies the kNN 
% parameter |K|. The default value is set to be |totDim*log(N)|
%
%% Example
X = WME_ellipsoid(1e4, 3, 'a', 4, 'b', 3, 'c', 2, 'e', 1);
[tgtBasis, nomBasis] = WME_tangent_spaces(X, 3);
wgtmap = WME_wgtmap(X, tgtBasis, nomBasis);
size(wgtmap)
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>