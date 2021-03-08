function WME_idea

% draw a quadratic surface

xCoor = linspace(-1.4,1.4,100);
yCoor = linspace(-1.4,1.4,100);
[xMesh, yMesh] = meshgrid(xCoor,yCoor);
z = -(xMesh.^2+yMesh.^4);
surf(xMesh, yMesh, z,'FaceAlpha',0.5);
shading interp
axis tight off
hold on
% draw xy plane (tangent to origin)

xCorn = [-1.5 -1.5 1.5 1.5];
yCorn = [-1.5 1.5 1.5 -1.5];
zCorn = [0 0 0 0];

patch(xCorn, yCorn, zCorn, zCorn, 'FaceAlpha',0.2)


% draw two position points
ori = [0 0 0];
p = [-1.3 -0.9 -(1.3^2+0.9^6)];
pt = [-1.3 -0.9 0];
position = [ori;p;pt];
scatter3(position(:,1),position(:,2),position(:,3),36,'k','filled','MarkerEdgeColor','k');

% draw normals
oriN = [0 0 1];
pN = [-2.6 -6*0.9^5 1];
pN = pN/norm(pN);
quiver3(0,0,0,0,0,1,1,'k','LineWidth',1.5);
%quiver3(p(1),p(2),p(3),0,0,1,1,'k','LineWidth',1.5);
quiver3(p(1),p(2),p(3),pN(1),pN(2),pN(3),1,'k','LineWidth',1.5);

% draw differences
line([0 -1.3],[0 -0.9],[0 p(3)],'LineWidth',1.5,'LineStyle','--')
%line([p(1)+0 p(1)+pN(1)],[p(2)+0,p(2)+pN(2)],[p(3)+1,p(3)+pN(3)],'LineWidth',1.5,'LineStyle','--')
diffpN = pN-oriN;
quiver3(0,0,0,diffpN(1),diffpN(2),diffpN(3),1,'k','LineWidth',1.5);

% draw projections
quiver3(0,0,0,pt(1),pt(2),pt(3),1,'r','LineWidth',1.5);
scatter3(diffpN(1),diffpN(2),0,36,'k','filled','MarkerEdgeColor','k');
quiver3(0,0,0,diffpN(1),diffpN(2),0,1,'r','LineWidth',1.5);

text(0.7,-0.6,0.5,'$T_{p}\mathcal{M}$','Fontsize',24,'Interpreter','latex')
text(0,-0.1,0.1,'$p$','Fontsize',24,'Interpreter','latex')
text(0,-0.1,1.1,'$\xi_{p}$','Fontsize',24,'Interpreter','latex')
text(p(1)-0.25,p(2)-0.2,p(3),'$q$','Fontsize',24,'Interpreter','latex')
text(p(1)+pN(1)-0.25,p(2)+pN(2)-0.2,p(3)+pN(3),'$\xi_{q}$','Fontsize',24,'Interpreter','latex')
text(pt(1)-1,pt(2)-1,2.5,'$(q-p)^\top$','Fontsize',24,'Interpreter','latex')
text(diffpN(1),diffpN(2)-0.1,0.2,'$(\xi_{q}-\xi_{p})^\top$','Fontsize',24,'Interpreter','latex')
text(diffpN(1)-0.2,diffpN(2)-0.1,-1.2,'$(\xi_{q}-\xi_{p})$','Fontsize',24,'Interpreter','latex')
text(0.7,-0.6,-4,'$\mathcal{M}$','Fontsize',24,'Interpreter','latex')
