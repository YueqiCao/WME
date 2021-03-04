%% WME_orient_nom
% orient normal vectors on (hypersurface) point clouds to get a consistent 
% global normal vector field.
%
% nom = WME_orient_nom(X, nom) produces a consistent normal vector field
% nom with the same size as point cloud X.
%
% nom = WME_orient_nom(X, nom, 'K', kNNParameter) specifies the kNN
% paramter when constructing the kNN graph. The default value is 11. Note that
% small k will yield disconnected graph while large k will increase the
% complexity.
%
% see also graph, minspantree, dfsearch
%
% reference: H.Hoppe, PhD Thesis, 
% https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/thesis-9.pdf
%
% author: Yueqi Cao
% github: https://github.com/YueqiCao/WME.git
% contact: bityueqi@gmail.com
% homepage: yueqihome.site

function nom = WME_orient_nom(X, nom, varargin)

N = length(X(:,1));
value = 11;
[IDX, distance] = knnsearch(X,X,'K',value);

if length(varargin) > 0
    paraName = varargin{1};
    value = varargin{2};
    [IDX, distance] = knnsearch(X,X,paraName,value);
end

% construct knn graph
s = [];
t = [];
weight = [];

for iPoint = 1:N
    for kNeigh = 1:value-1
        s = [s, iPoint];
        iIndex = IDX(iPoint, kNeigh+1);
        t = [t, iIndex];
        thisWeight = 1 - abs(nom(iPoint,:)*nom(iIndex,:)');
        weight = [weight, thisWeight];
    end
end

G = simplify(graph(s,t,weight));
nComp = conncomp(G);
if length(find(nComp==2)>0) > 0
    error('kNN graph is not connected')
end

% minimal spanning tree of knn graph
T = minspantree(G);

% dfsearch
searchTable = dfsearch(T, 1, 'allevents', 'Restart', true);
edgeTable = searchTable.Edge;
nanRows = find(isnan(edgeTable(:,1)));
edgeTable(nanRows,:) = [];

% orient normals
tags = zeros(N,1);
tags(1) = 1;
while length(edgeTable(:,1)) > 0
    left = edgeTable(1,1);
    right = edgeTable(1,2);
    if tags(right) == 0
        if nom(left,:)*nom(right,:)' < 0
            nom(right,:) = -nom(right,:);
        end
        tags(right) = 1;
    end
    edgeTable(1,:) = [];
end

% check tags
check0 = find(tags == 0);
if ~isempty(check0)
    check0
    error('Wrong search!')
end