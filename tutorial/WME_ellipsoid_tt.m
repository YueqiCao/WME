%% WME_ellipsoid
% Generate random points from ellipsoids of various dimension 
%
%% Syntax
% 
% * |X = WME_ellipsoid(N, dim)|
% * |[X, nomVec] = WME_ellipsoid(N, dim)|
% * |[X, nomVec, meanCurv] = WME_ellipsoid(N, dim)|
% * |[X, ...] = WME_ellipsoid(..., name,value)|
%
%% Description
%
% * |X = WME_ellipsoid(N, dim)| produces an |N*(dim+1)| matrix |X| whose row vectors are
% points on a |dim|-dimensional *unit sphere* embedded in a |(dim+1)| dimensional Euclidean space
% * |[X, nomVec] = WME_ellipsoid(N, dim)| produces points |X| together with normal vectors
% |nomVec| 
% * |[X, nomVec, meanCurv] = WME_ellipsoid(N, dim)| produces points |X|, normal vectors
% |nomVec|, and mean curvature |meanCurv| (for 2-dimensional surfaces it corresponds to 
% *absolute mean curvature*)
% * |[X, ...] = WME_ellipsoid(..., name,value)| produces points from
% general ellipsoids with parameters specified by name-value. The standard
% equation for a general ellipsoid is 
% $x_1^2/a^2 + x_2^2/b^2 + x_3^2/c^2 + x_4^2/d^2 + x_5^2/e^2 = 1$. 
% The input format for name-value should be like: |'a', 3, 'b', 2| and so on.
%% Example
X = WME_ellipsoid(10, 1) % points on a unit circle
%% 
[X, nomVec, meanCurv] = WME_ellipsoid(10, 3, 'a', 5, 'b', 4, 'c', 3, 'e', 2)
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>