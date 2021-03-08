%% WME_torus
% Generate random points from 2-dim torus
%
%% Syntax
% 
% * |X = WME_torus(N)|
% * |X = WME_torus(N, majorRad, minorRad)|
% * |[X, nomVec] = WME_torus(N,...)|
% * |[X, nomVec, gaussCurv] = WME_torus(N,...)|
% * |[X, nomVec, gaussCurv, meanCurv] = WME_torus(N,...)|
%
%% Description
%
% * |X = WME_torus(N)| produces an |N*3| matrix |X| whose row vectors are
% points on a torus with default major radius 4 and minor radius 0.5
% * |X = WME_torus(N, majorRad, minorRad)| produces points but also specifies 
% the major and minor radius of the torus
% * |[X, nomVec] = WME_torus(N,...)| produces points |X| together with normal vectors
% |nomVec|
% * |[X, nomVec, gaussCurv] = WME_torus(N,...)| produces points |X|, normal vectors
% |nomVec| and Gauss curvature |gaussCurv|
% * |[X, nomVec, gaussCurv, meanCurv] = WME_torus(N,...)| produces points |X|,
% normal vectors |nomVec|, Gauss curvature |gaussCurv|, and mean curvature
% |meanCurv|
%
%% Example
X = WME_torus(10)
%% 
[X, nomVec, gaussCurv] = WME_torus(10, 5, 2)
%% Contact
% Author: Yueqi Cao
% Email: bityueqi@gmail.com
% Web: <https://yueqihome.site>
