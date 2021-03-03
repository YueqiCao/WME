clear
close all
clc
tic()


load stan_cmaps

A = whos;
z = 1:256;
zc = 1:16:256;
X = repmat(z,12,1);
acc_colors


figure()
set(gcf, 'Position', [1, 1, 1000, 9000])
subplot(numel(A),2,1)
colormap(eval(A(1).name))
contourf(X,'LineStyle','none','LevelList',z)
xticklabels({})
yticklabels({})
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3);% - 0.01;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.01;
ax.Position = [left bottom ax_width ax_height];
ax.AmbientLightColor = Color(:,36)';
set(gca,'xtick',[])
set(gca,'ytick',[])
pbaspect([13 1 1])
title(A(1).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
set(gca, 'defaultTextFontName', 'Ubuntu')

ax2 = subplot(numel(A),2,2);
cm = eval(A(1).name);
colormap(ax2,cm)
contourf(X,'LineStyle','none','LevelList',zc)
xticklabels({})
yticklabels({})
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3);% - 0.01;
ax_height = outerpos(4) - ti(2) - ti(4) + 0.01;
ax.Position = [left bottom ax_width ax_height];
set(gca,'xtick',[])
set(gca,'ytick',[])
ax.AmbientLightColor = Color(:,36)';
pbaspect([13 1 1])
colormap(ax2,cm)
title(A(1).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
set(gca, 'defaultTextFontName', 'Ubuntu')

jj = 3;

for ii=2:numel(A)
    ax3 = subplot(numel(A),2,jj);
    cm = eval(A(ii).name);
    colormap(ax3,cm)
    contourf(X,'LineStyle','none','LevelList',z)
    xticklabels({})
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3);% - 0.01;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.01;
    ax.Position = [left bottom ax_width ax_height];
    set(gca,'xtick',[])
    set(gca,'ytick',[])
    ax.AmbientLightColor = Color(:,36)';
    pbaspect([13 1 1])
    colormap(ax3,cm)
    title(A(ii).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
    set(gca, 'defaultTextFontName', 'Ubuntu')
    
    jj = jj + 1;
    
    ax4 = subplot(numel(A),2,jj);
    cm = eval(A(ii).name);
    colormap(ax4,cm)
    contourf(X,'LineStyle','none','LevelList',zc)
    xticklabels({})
    yticklabels({})
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset;
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2) + 0.01;
    ax_width = outerpos(3) - ti(1) - ti(3);% - 0.01;
    ax_height = outerpos(4) - ti(2) - ti(4) + 0.01;
    ax.Position = [left bottom ax_width ax_height];
    set(gca,'xtick',[])
    set(gca,'ytick',[])
    ax.AmbientLightColor = Color(:,36)';
    pbaspect([13 1 1])
    colormap(ax4,cm)
    title(A(ii).name,'Interpreter','none','FontWeight','Normal','FontSize',15)
    set(gca, 'defaultTextFontName', 'Ubuntu')
    
    jj = jj + 1;
end

print('colormaps','-dpng')



toc()