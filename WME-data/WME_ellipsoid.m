%% WME_ellipsoid
% Generate random points from ellipsoids of various dimension 
%
% X = WME_ellipsoid(N, dim) produces an N*(dim+1) matrix X whose row vectors are
% points on a dim dimensional unit sphere embedded in a dim+1 Euclidean space
%
% X = WME_ellipsoid(N, dim, ...) specifies the parameters in the equation
% x1^2/a^2 + x2^2/b^2 + x3^2/c^2 + x4^2/d^2 + x5^2/e^2 = 1 
% the max dimension is 4
%
% [X, nom] = WME_ellipsoid(N,...) produces points X together with normal vectors
% nom
% 
% [X, nomVec, meanCurv] = WME_ellipsoid(N,...) produces points X, normal vectors
% nom and mean curvature meanCurv
%
% Example:
% X = WME_ellipsoid(1e4, 2, 'a', 5, 'b', 4, 'c', 3);
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site


function varargout = WME_ellipsoid(N, dim, varargin)

a = 1; b = 1; c = 1; d = 1; e = 1;

inputPara = varargin;

while length(inputPara) >= 2
    para = inputPara{1};
    value = inputPara{2};
    inputPara = inputPara(3:end);
    switch para
        case 'a'
            a = value;
        case 'b'
            b = value;
        case 'c'
            c = value;
        case 'd'
            d = value;
        case 'e'
            e = value;
        otherwise
            warning('max dimension is 4!!!');
    end
end

A = 1/a^2; B = 1/b^2; C = 1/c^2; D = 1/d^2; E = 1/e^2;

arg1 = 0; arg2 = 0; arg3 = 0; arg4 = 0;

X = zeros(N, 5);
nom = zeros(N, 5);
meanCurv = zeros(N, 1);

for i = 1:N
    switch dim
        case 1
            arg1 = 2*pi*rand;
        case 2
            arg1 = pi*rand;
            arg2 = 2*pi*rand;
        case 3
            arg1 = pi*rand;
            arg2 = pi*rand;
            arg3 = 2*pi*rand;
        case 4
            arg1 = pi*rand;
            arg2 = pi*rand;
            arg3 = pi*rand;
            arg4 = 2*pi*rand;
    end
    X(i,:) = [a*cos(arg1), b*sin(arg1)*cos(arg2), ...
        c*sin(arg1)*sin(arg2)*cos(arg3), d*sin(arg1)*sin(arg2)*sin(arg3)*cos(arg4), ...
        e*sin(arg1)*sin(arg2)*sin(arg3)*sin(arg4)];
    meanCurv(i) = 1/4*(A^2*(B+C+D+E)*X(i,1)^2 + B^2*(A+C+D+E)*X(i,2)^2 + C^2*(A+B+D+E)*X(i,3)^2 ...
        + D^2*(A+B+C+E)*X(i,4)^2 + E^2*(A+B+C+D)*X(i,5)^2) ...
        / (A^2*X(i,1)^2 + B^2*X(i,2)^2 + C^2*X(i,3)^2 + D^2*X(i,4)^2 + E^2*X(i,5)^2)^(3/2);
    nom(i,:) = [A*X(i,1), B*X(i,2), C*X(i,3), D*X(i,4), E*X(i,5)] / sqrt(A^2*X(i,1)^2 ...
        + B^2*X(i,2)^2 + C^2*X(i,3)^2 + D^2*X(i,4)^2 + E^2*X(i,5)^2);
end

if dim < 4
    X(:,dim+2:end) = [];
    nom(:, dim+2:end) = [];
end

switch nargout
    case 1
        varargout{1} = X;
    case 2
        varargout{1} = X;
        varargout{2} = nom;
    case 3
        varargout{1} = X;
        varargout{2} = nom;
        varargout{3} = meanCurv;
end
            