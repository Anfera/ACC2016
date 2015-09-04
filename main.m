%% Main

Parametros
DifferentialGame
MPC

%%
figure
subplot(2,2,[1,2])
stairs(t,V_normalized)
legend(['v_1'; 'v_2'; 'v_3'; 'v_4'; 'v_5';'v_6']);
xlabel('time [h]')
ylabel('% of occupancy')
title('Normalized Volumes - Open loop')
subplot(2,2,3)
plot(t',xdg')
legend(['v_1'; 'v_2'; 'v_3'; 'v_4'; 'v_5';'v_6']);
ylabel('% of occupancy - DG')
xlabel('time [h]')
title('Normalized Volumes - DG')
subplot(2,2,4)
plot(t',xmpc')
legend(['v_1'; 'v_2'; 'v_3'; 'v_4'; 'v_5';'v_6']);
xlabel('time [h]')
title('Normalized Volumes - MPC')

figure
subplot(2,2,1)
plot(t(1:end-1),3600*vdg)
legend(['v_1'; 'v_2'; 'v_3'; 'v_4'; 'v_5';'v_6']);
ylabel('volume [m^3] - DG')
title('DG')
subplot(2,2,2)
plot(t(1:end-1),3600*vmpc)
legend(['v_1'; 'v_2'; 'v_3'; 'v_4'; 'v_5';'v_6']);
title('MPC')
subplot(2,2,3)
stairs(t(1:end-1),Udg)
legend(['q_1'; 'q_2'; 'q_3'; 'q_4'; 'q_5']);
xlabel('time [h]')
ylabel('flow [m^3/s]')
subplot(2,2,4)
stairs(t(1:end-1),Umpc)
legend(['q_1'; 'q_2'; 'q_3'; 'q_4'; 'q_5']);
xlabel('time [h]')
