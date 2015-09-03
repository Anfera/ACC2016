%% Parametros
% This file gets the maximum capacity of the reservoirs from the
% convergence network, as well as the inflows from rain water to the
% network. It generates the volumes of the storages with no control for
% plotting purpuses.
close all; clear all; clc;
swmm = SWMM;

inp = 'swmm_files/convergencia2.inp';
swmm.run_simulation(inp); disp('Simulación terminada');
T1 = {'C1','C2','C3','C4'};
T2 = {'C5','C6'};
T3 = {'C7','C8'};
T4 = {'C9','C10'};
T5 = {'C11','C12','C13'};
T6 = {'C14'};

[t, volume1] = swmm.read_results(T1, swmm.LINK, swmm.VOLUME);
[t, volume2] = swmm.read_results(T2, swmm.LINK, swmm.VOLUME);
[t, volume3] = swmm.read_results(T3, swmm.LINK, swmm.VOLUME);
[t, volume4] = swmm.read_results(T4, swmm.LINK, swmm.VOLUME);
[t, volume5] = swmm.read_results(T5, swmm.LINK, swmm.VOLUME);
[t, volume6] = swmm.read_results(T6, swmm.LINK, swmm.VOLUME);


vmax(1) = sum(max(volume1));
vmax(2) = sum(max(volume2));
vmax(3) = sum(max(volume3));
vmax(4) = sum(max(volume4));
vmax(5) = sum(max(volume5));
vmax(6) = sum(max(volume6));

dt = t(end) - t(end-1);% dt = dt*3600; % hr -> s

%%
inp = 'swmm_files/convergencia.inp';
swmm.run_simulation(inp); disp('Simulación terminada');
T1 = {'C1','C2','C3','C4'};
T2 = {'C5','C6'};
T3 = {'C7','C8'};
T4 = {'C9','C10'};
T5 = {'C11','C12','C13'};
T6 = {'C14'};

%% Getting Qin from SWMM
inputs = {'N-1', 'N-9', 'N-19', 'N-15'};
[t, inflows] = swmm.read_results(inputs, swmm.NODE, swmm.INFLOW);

%vmax = [1.8449168e+03 2.100119e+03 3.215527e+03 1.820571e+03 1.56656e+03 7.580768e+03];
K = [0.0004    0.0008    0.0033    0.0005    0.0008    0.0018]';

[t, volume1] = swmm.read_results(T1, swmm.LINK, swmm.VOLUME);
[t, volume2] = swmm.read_results(T2, swmm.LINK, swmm.VOLUME);
[t, volume3] = swmm.read_results(T3, swmm.LINK, swmm.VOLUME);
[t, volume4] = swmm.read_results(T4, swmm.LINK, swmm.VOLUME);
[t, volume5] = swmm.read_results(T5, swmm.LINK, swmm.VOLUME);
[t, volume6] = swmm.read_results(T6, swmm.LINK, swmm.VOLUME);

Volumes = [sum(volume1')' sum(volume2')' sum(volume3')' sum(volume4')' sum(volume5')' volume6];

save('Parametros.mat')