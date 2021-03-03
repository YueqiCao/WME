%% WME_torus
% generate random points from 2-dim torus 
%
% X = WME_torus(N) produces an N*3 matrix X whose row vectors are
% points on a torus with default major radius 4 and minor radius 0.5
%
% X = WME_torus(N, majorRad, minorRad) produces points but also specifies 
% the major and minor radius of the torus
%
% [X, nomVec] = WME_torus(N,...) produces points X together with normal vectors
% nomVec
% 
% [X, nomVec, gaussCurv] = WME_torus(N,...) produces points X, normal vectors
% nomVec and gauss curvature gaussCurv
%
% [X, nomVec, gaussCurv, meanCurv] = WME_torus(N,...) produces points X,
% normal vectors nomVec, gauss curvature gaussCurv, and mean curvature
% meanCurv
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function varargout = WME_torus(N, majorRad, minorRad)

% default major and minor radius
R = 4; 
r = 0.5; 

switch nargin
    case 2
        R = majorRad;
    case 3
        R = majorRad;
        r = minorRad;
        if 2*r >= R
            error('Invalid major and minor radius!!');
        end
end

X = zeros(N,1);
Y = zeros(N,1);
Z = zeros(N,1);
nomVec =zeros(N,3);
gaussCurv = zeros(N,1);
meanCurv = zeros(N,1);

for i = 1:N
    theta=4*pi*rand;
    alpha=4*pi*rand;
     
    X(i) = (R+r*cos(theta)) * cos(alpha);
    Y(i) = (R+r*cos(theta)) * sin(alpha);
    Z(i) = r*sin(theta);
    nomVec(i,:) = [cos(theta)*cos(alpha), cos(theta)*sin(alpha), sin(theta)];
    gaussCurv(i) = cos(theta) / (r*(R+r*cos(theta)));
    meanCurv(i) = -(1/r+cos(theta) / (R+r*cos(theta))) / 2;
end

positionVec = [X,Y,Z];

switch nargout
    case 1
        varargout{1} = positionVec;
    case 2
        varargout{1} = positionVec;
        varargout{2} = nomVec;
    case 3
        varargout{1} = positionVec;
        varargout{2} = nomVec;
        varargout{3} = gaussCurv;
    case 4
        varargout{1} = positionVec;
        varargout{2} = nomVec;
        varargout{3} = gaussCurv;
        varargout{4} = meanCurv;
end