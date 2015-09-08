%% Plots

puntos = 10;
escala = 60;
time = [];
Qin = [];
for i = 1:puntos
    timeSC(i) = t(escala*i);
    Qin(i,:) = inflows(escala*i,:);
    V_normalizedSC(i,:) = V_normalized(escala*i,:);
    vdgSC(i,:) = vdg(escala*i,:);
    vmpcSC(i,:) = vmpc(escala*i,:);
    xdgSC(:,i) = xdg(:,escala*i);
    xmpcSC(:,i) = xmpc(:,escala*i);
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
hgexport(h,'Graficas/mpc.pdf');
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
hgexport(h,'Graficas/dg.pdf');
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
hgexport(h,'Graficas/openloop.pdf');
close all
