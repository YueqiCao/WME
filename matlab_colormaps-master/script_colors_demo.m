clear
close all
clc

tic()

acc_colors


X1 = 1:0.1:10;
X2 = 0.5:0.1:10;
lw = 10;
coords = [0 10 0 51];

figure()
set(gcf, 'Position', [1, 1, 1600, 900])
plot(X1,ones(91,1),'LineWidth',lw,'Color',Color(1,:))
hold on
for ii=2:50
    if mod(ii,2)==0
        plot(X2,ii*ones(96,1),'LineWidth',lw,'Color',Color(ii,:))
    else
        plot(X1,ii*ones(91,1),'LineWidth',lw,'Color',Color(ii,:))
    end
end
for ii=1:50
    if mod(ii,2)==0
        text(0.3,ii,num2str(ii),'FontSize',13)
    else
        text(0.8,ii,num2str(ii),'FontSize',13)
    end    
end
axis(coords)
ax.AmbientLightColor = Color(36,:)';
set(gca,'xtick',[])
set(gca,'ytick',[])
acc_plots
hold off
print('color_demo','-dpng')





toc()