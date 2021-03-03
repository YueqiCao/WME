# matlab_colormaps
a set of plotting colors and colormaps for MATLAB

Usage:

To make a line plot using one of the solid colors (look at the 'color_demo.png' and say you want #9), call

acc_colors

plot(X,Y,'Color',Color(9,:))

To use a colormap, look at the 'colormaps.pdf' and select a colormap you like (say cmo_tempo)

cm = acc_colormaps('cmo_tempo');

colormap(cm)

contourf(X,Y,Z)
