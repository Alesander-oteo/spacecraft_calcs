close all
clear variables
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');

% Data = readmatrix("5Y_SMA.csv");
% Data = readmatrix("5Y_Angles.csv");
Data = readmatrix("5Y_Angles_RAAN_170.csv");
sz = size(Data);
% N = isnan(Data);
N = find(isnan(Data));
INC = Data(1:N(1)-1,:);
RAAN = Data(N(1)+1:N(2)-1,:);
BETA = Data(N(2)+1:sz(1),:);
szB = size(BETA);
eclipse = zeros(1,szB(1));
eclipse(:) = 62.7;

% plot(Data(:,1),Data(:,2),"r")
% ylim([0,900])

h = plot(INC(:,1)./365,INC(:,2),BETA(:,1)./365,BETA(:,2),RAAN(:,1)./365,RAAN(:,2),BETA(:,1)./365,eclipse,":");
colors = {[0 0.4470 0.7410], [0.2940 0.5840 0.2560], [0.6350 0.0780 0.1840],"k"};
[h(1).Color,h(2).Color,h(3).Color,h(4).Color] = colors{:}; % change the colors
grid on
ylim([-100,420])
xlim([0,5.4])
xlabel("$t[a]$",'Interpreter','latex')
ylabel("$i,\Omega,\beta [^{\circ}]$",'Interpreter','latex')
lgd = legend("$i$","$\beta$","$\Omega$","$\beta_{min}$",'Interpreter','latex');
% lgd.NumColumns = 4;