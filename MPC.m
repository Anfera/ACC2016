%% Control Based on MPC
% Este archivo resuelve el problema de volumenes normalizados en la red de
% convergencia mediante un model predictive control.
clear all
close all
clc

load('Parametros.mat'); %Cargamos las variables de lluvia del problema

% Primero obtenemos el resultado sin control.
%vmax(6) = vmax(6)/2;
for i = 1:size(Volumes,1)
    V_normalized(i,:) = Volumes(i,:)./(vmax);
end

% Definimos las variables del problema
T = 0.1;               % Esta variable es el horizonte de prediccion en horas
tspan = t;             % Tiempo de simulacion definido en SWMM
x0 = zeros(6,1);       % Los tanques empiezan descargados
vmax = vmax/3600;      % El 3600 es por la integración utilizada
N = ceil(T/dt);        % Horizonte de predicción
d = dt*[inflows(:,1) inflows(:,2) zeros(size(inflows(:,1))) inflows(:,3) inflows(:,4) zeros(size(inflows(:,1)))]'; % Perturmaciones

a1 = -0;
a2 = -0;
a3 = -0;
a4 = -0;
a5 = -0;
a0 = -K(6);          % Aqui es necesario añadir el K del último tanque

A = 3600*diag([a1 a2 a3 a4 a5 a0]); % K fue calculado en segundos, por eso el 3600
B = [-1 0 0 0 0; 
     0 -1 0 0 0; 
     1 1 -1 0 0;
     0 0 0 -1 0; 
     0 0 0 0 -1; 
     0 0 1 1 1]; % Esta matriz contiene la interaccion entre tanques, recordar el grafo.
 
sys = ss(A,B,eye(length(A)),zeros(size(A,1),size(B,2))); 
sysd = c2d(sys,dt);

yalmip('clear')
% Model data
A = sysd.a;
B = sysd.b;
nx = size(A,1); % Number of states
nu = size(B,2); % Number of inputs

% MPC data
Q1 = 50*[1 0 -1 0 0 0; 0 0 0 0 0 0; -1 0 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
Q2 = 50*[0 0 0 0 0 0; 0 1 -1 0 0 0; 0 -1 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
Q3 = 50*[0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 1 0 0 -1; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 -1 0 0 1];
Q4 = 50*[0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 1 0 -1; 0 0 0 0 0 0; 0 0 0 -1 0 1];
Q5 = 50*[0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 1 -1; 0 0 0 0 -1 1];

Q = Q1 + Q2 + Q3 + Q4 + Q5;
R = eye(size(B,2));

X = zeros(size(A,1),length(tspan));
X(:,1) = x0;

for i = 1:length(tspan)-1
    [i length(tspan)-1]
    
    u = sdpvar(repmat(nu,1,N),repmat(1,1,N));
    X0 = sdpvar(6,1);

    constraints = [];
    objective = 0;
    x = X0;
    for k = 1:N
     x = A*x + B*u{k};
     objective = objective + norm(Q*x,1) + norm(R*u{k},1);
     %constraints = [constraints, -1 <= u{k}<= 1, -5<=x<=5];
    end

    optimize([constraints, X0 == X(:,i)],objective);
    U = value(u{1})
    
    X(:,i+1) = A*X(:,i) + B*U + d(:,i);
end