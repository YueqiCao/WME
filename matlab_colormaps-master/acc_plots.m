set(gca, 'defaultUicontrolFontName', 'Ubuntu')
set(gca, 'defaultUitableFontName', 'Ubuntu')
set(gca, 'defaultAxesFontName', 'Ubuntu')
set(gca, 'defaultTextFontName', 'Ubuntu')
set(gca, 'defaultUipanelFontName', 'Ubuntu')
% set(gca,'DefaultAxesFontSize', 14)
% set(0,'DefaultTextFontSize', 14)
% fig = gcf;
% set(findall(fig, '-property', 'FontSize'), 'FontSize', 14)
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
left = outerpos(1) + ti(1) + 0.01;
bottom = outerpos(2) + ti(2) + 0.01;
ax_width = outerpos(3) - ti(1) - ti(3) - 0.03;
ax_height = outerpos(4) - ti(2) - ti(4) - 0.02;
ax.Position = [left bottom ax_width ax_height];
