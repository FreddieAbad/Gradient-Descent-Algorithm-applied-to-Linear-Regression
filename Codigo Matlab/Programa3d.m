%clear; close all; clc;
% Implementación de algoritmo de regresión lineal con una variable.
% Algoritmo predice los beneficios que se podrían obtener de una ciudad dependiendo de su población.

% Leo datos
data = load('examples.txt');

% Inicializo Matrices y Variables
X = data(:, 1);     % Matriz caracteristica
y = data(:, 2);     % Resultados de matriz
m = length(y);      % Numero de ejemplo a entrenar
theta = zeros(2, 1);     % Pesos iniciales
iterations = 1500;  % Iteraciones necesarias para Gradient Descent
alpha = 0.001;       % Tasa de Aprendizaje
Xaux=X;
% Dibujo Datos
plot3(X, y, 'rx', 'MarkerSize', 10);
title('Datos de Entrenamiento');
xlabel('Poblacion Escala 10,000');
ylabel('Ingresos Total por Mes');

% Calculo Coste 
X = [ones(m, 1), data(:, 1)];
J = Costo(X, y, theta);
fprintf('Punto Minimo para Funcion de Coste : %d\n',J);

% Corro Gradient Descent
[theta, Js] = DescensoGradiente(X, y, theta, alpha, iterations);

hold on;
plot(X(:, 2), X * theta, '-');
legend('Datos de Entrenamiento', 'Regresion Lineal');
hold on;

% Grafica costo
plot(1: iterations, J, '-b');

% Predicting Profits
fprintf('\nPrediccion para 35000\n');
fprintf('Prediccion para 3.5:\t%f\n', ([1, 3.5] * theta) );
fprintf('\nPrediccion para 70000\n');
fprintf('Prediccion para 7.0:\t%f\n', ([1, 7] * theta) );
