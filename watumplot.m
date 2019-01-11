function watumplot(YMatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 05-Apr-2016 22:41:10

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','ZColor',[0 0 0],'YColor',[0 0 0],...
    'XColor',[0 0 0],...
    'FontWeight','bold',...
    'FontSize',12,...
    'FontName','Consolas');
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 1000]);
box(axes1,'on');
hold(axes1,'on');

% Create ylabel
ylabel({'Concentration [mgr/Meter^3 ]'},'FontSize',14);

% Create xlabel
xlabel(['Longitudinal Steps           ';'Along River (?X = 100 meters)'],'HorizontalAlignment','center',...
    'FontSize',14);

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'Parent',axes1,'Color',[0.152941182255745 0.227450981736183 0.372549027204514]);
set(plot1(1),'Color',[0 0.447 0.741]);
set(plot1(11),'DisplayName','data4','MarkerEdgeColor',[1 0 1]);

% Create light
light('Parent',axes1,'Position',[-0.99999537040252 0.000962245993817124 0.00288673798145137]);

% Create colorbar
colorbar('peer',axes1);


