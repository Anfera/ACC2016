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
N = round(T/dt);        % Horizonte de predicción
d = dt*[inflows(:,1) inflows(:,2) zeros(size(inflows(:,1))) inflows(:,3) inflows(:,4) zeros(size(inflows(:,1)))]'; % Perturmaciones

a1 = -0;
a2 = -0;
a3 = -0;
a4 = -0;
a5 = -0;
a0 = -K(6)/vmax(6);          % Aqui es necesario añadir el K del último tanque

A = 3600*diag([a1 a2 a3 a4 a5 a0]); % K fue calculado en segundos, por eso el 3600
B = [-1/vmax(1) 0 0 0 0; 
     0 -1/vmax(2) 0 0 0; 
     1/vmax(3) 1/vmax(3) -1/vmax(3) 0 0;
     0 0 0 -1/vmax(4) 0; 
     0 0 0 0 -1/vmax(5); 
     0 0 1/vmax(6) 1/vmax(6) 1/vmax(6)]; % Esta matriz contiene la interaccion entre tanques, recordar el grafo.
 
sys = ss(A,B,eye(length(A)),zeros(size(A,1),size(B,2))); 
sysd = c2d(sys,dt);

yalmip('clear')
% Model data
A = sysd.a;
B = sysd.b;
nx = size(A,1); % Number of states
nu = size(B,2); % Number of inputs

% MPC data
Q1 = [1 0 -1 0 0 0; 0 0 0 0 0 0; -1 0 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
Q2 = [0 0 0 0 0 0; 0 1 -1 0 0 0; 0 -1 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];
Q3 = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 1 0 0 -1; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 -1 0 0 1];
Q4 = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 1 0 -1; 0 0 0 0 0 0; 0 0 0 -1 0 1];
Q5 = [0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 1 -1; 0 0 0 0 -1 1];

Q = Q1 + Q2 + Q3 + Q4 + Q5;
Q = 50*Q;
R = eye(size(B,2));

X = zeros(size(A,1),length(tspan));
X(:,1) = x0;

u = sdpvar(repmat(nu,1,N),repmat(1,1,N));
x0 = sdpvar(6,1);

constraints = [];
objective = 0;
x = x0;
for k = 1:N
 x = A*x + B*u{k};
 objective = objective + norm(Q*x,1) + norm(R*u{k},1);
 constraints = [constraints, 0 <= u{k}, 0<=x];
end

ops = sdpsettings('verbose',0);
controller = optimizer(constraints,objective,ops,x0,u{1});

x(:,1) = zeros(6,1);
for i = 1:length(tspan)-1
 uk = controller{x(:,i)};
 x(:,i+1) = A*x(:,i) + B*uk + d(:,i);
 [i length(tspan)-1]
end

plot(x')
