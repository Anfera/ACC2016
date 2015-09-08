%% Plots
load('data.mat')
puntos = 10;
escala = 60;
time = [];
Qin = [];
v = 3600*v;
vmpc = 3600*vmpc;
vdg = 3600*vdg;
for i = 1:puntos
    timeSC(i) = t(escala*i);
    Qin(i,:) = inflows(escala*i,:);
    V_normalizedSC(i,:) = V_normalized(escala*i,:);
    VSC(i,:) = v(escala*i,:);
    vdgSC(i,:) = vdg(escala*i,:);
    vmpcSC(i,:) = vmpc(escala*i,:);
    xdgSC(:,i) = xdg(:,escala*i);
    xmpcSC(:,i) = xmpc(:,escala*i);
    UdgSC(:,i) = Udg(escala*i,:);
    UmpcSC(:,i) = Umpc(escala*i,:);
end

%% Perturbaciones
figure
hold on;
plot(t, inflows(:,1), 'color', [0 0 0]+0.8, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, inflows(:,2), 'color', [0 0 0]+0.6, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, inflows(:,3), 'color', [0 0 0]+0.4, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, inflows(:,4), 'k', 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, Qin(:,1), 80, 'k', 's', 'displayname', 'D_1');
scatter(timeSC, Qin(:,2), 80, 'k', '+', 'displayname', 'D_2');
scatter(timeSC, Qin(:,3), 80, 'k', 'c', 'displayname', 'D_4');
scatter(timeSC, Qin(:,4), 80, 'k', 'd', 'displayname', 'D_5');
axis([0 10 0 6]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('run-off $$[m^3 / s]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/dist.pdf');
close all

%% Volumenes normalizados
figure
hold on
plot(t, xmpc(1,:), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xmpc(2,:), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xmpc(3,:), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xmpc(4,:), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xmpc(5,:), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xmpc(6,:), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, xmpcSC(1,:), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, xmpcSC(2,:), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, xmpcSC(3,:), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, xmpcSC(4,:), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, xmpcSC(5,:), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, xmpcSC(6,:), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 1.1]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Normalized volume $$[\%]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/mpcN.pdf');
close all

figure
hold on
plot(t, xdg(1,:), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xdg(2,:), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xdg(3,:), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xdg(4,:), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xdg(5,:), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, xdg(6,:), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, xdgSC(1,:), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, xdgSC(2,:), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, xdgSC(3,:), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, xdgSC(4,:), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, xdgSC(5,:), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, xdgSC(6,:), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 1.1]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Normalized volume $$[\%]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/dgN.pdf');
close all

figure
hold on
plot(t, V_normalized(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, V_normalized(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, V_normalized(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, V_normalized(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, V_normalized(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t, V_normalized(:,6), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, V_normalizedSC(:,1), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, V_normalizedSC(:,2), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, V_normalizedSC(:,3), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, V_normalizedSC(:,4), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, V_normalizedSC(:,5), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, V_normalizedSC(:,6), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 1.5]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Normalized volume $$[\%]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/openloopN.pdf');
close all

%% Volumenes
figure
hold on
plot(t(1:end-1), vmpc(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vmpc(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vmpc(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vmpc(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vmpc(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vmpc(:,6), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, vmpcSC(:,1), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, vmpcSC(:,2), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, vmpcSC(:,3), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, vmpcSC(:,4), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, vmpcSC(:,5), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, vmpcSC(:,6), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 18000]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Volume $$[m^3]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/mpc.pdf');
close all

figure
hold on
plot(t(1:end-1), vdg(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vdg(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vdg(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vdg(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vdg(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), vdg(:,6), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, vdgSC(:,1), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, vdgSC(:,2), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, vdgSC(:,3), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, vdgSC(:,4), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, vdgSC(:,5), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, vdgSC(:,6), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 18000]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Volume $$[m^3]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/dg.pdf');
close all

figure
hold on
plot(t(1:end-1), v(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), v(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), v(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), v(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), v(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), v(:,6), 'color', [0 0 0]+0.16, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, VSC(:,1), 80, 'k', 'o', 'displayname', 'v_1');
scatter(timeSC, VSC(:,2), 80, 'k', '+', 'displayname', 'v_2');
scatter(timeSC, VSC(:,3), 80, 'k', '*', 'displayname', 'v_3');
scatter(timeSC, VSC(:,4), 80, 'k', 'd', 'displayname', 'v_4');
scatter(timeSC, VSC(:,5), 80, 'k', 'x', 'displayname', 'v_5');
scatter(timeSC, VSC(:,6), 80, 'k', 's', 'displayname', 'v_6');
axis([0 10 0 18000]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Volume $$[m^3]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/openloop.pdf');
close all

%% caudales
figure
hold on
plot(t(1:end-1), Umpc(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Umpc(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Umpc(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Umpc(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Umpc(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, UmpcSC(1,:), 80, 'k', 'o', 'displayname', 'u_1');
scatter(timeSC, UmpcSC(2,:), 80, 'k', '+', 'displayname', 'u_2');
scatter(timeSC, UmpcSC(3,:), 80, 'k', '*', 'displayname', 'u_3');
scatter(timeSC, UmpcSC(4,:), 80, 'k', 'd', 'displayname', 'u_4');
scatter(timeSC, UmpcSC(5,:), 80, 'k', 'x', 'displayname', 'u_5');
axis([0 10 0 3]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Outflow $$[m^3 / s]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/Umpc.pdf');
close all

figure
hold on
plot(t(1:end-1), Udg(:,1), 'color', [0 0 0]+0.0, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Udg(:,2), 'color', [0 0 0]+0.83, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Udg(:,3), 'color', [0 0 0]+0.66, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Udg(:,4), 'color', [0 0 0]+0.5, 'linewidth', 1.2, 'handlevisibility', 'off');
plot(t(1:end-1), Udg(:,5), 'color', [0 0 0]+0.33, 'linewidth', 1.2, 'handlevisibility', 'off');
scatter(timeSC, UdgSC(1,:), 80, 'k', 'o', 'displayname', 'u_1');
scatter(timeSC, UdgSC(2,:), 80, 'k', '+', 'displayname', 'u_2');
scatter(timeSC, UdgSC(3,:), 80, 'k', '*', 'displayname', 'u_3');
scatter(timeSC, UdgSC(4,:), 80, 'k', 'd', 'displayname', 'u_4');
scatter(timeSC, UdgSC(5,:), 80, 'k', 'x', 'displayname', 'u_5');
axis([0 10 0 3]);
legend('show');
xlabel('Time $$[hours]$$','Interpreter','latex','fontsize',12);
ylabel('Outflow $$[m^3 / s]$$','Interpreter','latex','fontsize',12);
h = figure(1);
set(gca, 'FontSize', 20)
hgexport(h,'Graficas/Udg.pdf');
%close all