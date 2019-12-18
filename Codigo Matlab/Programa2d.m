clear; close all; clc;

% read the training data
data = load('examples.txt');

% initialize Matrices and Variables
X = data(:, 1);     % featue matrix
y = data(:, 2);     % results matrix
m = length(y);      % number of training examples
theta = zeros(2, 1);     % initial weights
iterations = 1500;  % Iterations needed for Gradient Descent
alpha = 0.01;       % Learning Rate

% Plot the Data
plot(X, y, 'rx', 'MarkerSize', 10);
hold on;
title('Ejemplos de Entrenamiento');
xlabel('Poblacion en 10,000');
ylabel('Ingresos Total por Mes');

% Compute the Cost Function
X = [ones(m, 1), data(:, 1)];
J = Costo(X, y, theta);
fprintf('Punto Minimo para Funcion de Coste : %d\n',J);

% Run Gradient Descent
[theta, Js] = DescensoGradiente(X, y, theta, alpha, iterations);
hold on;
plot(X(:, 2), X * theta, '-');
legend('Training data', 'Linear regression');
hold off;

% plotting the cost function
%plot(1: iterations, J_history, '-b');

% Predicting Profits
fprintf('Prediccion for 35000(3.5):\t%f\n', ([1, 3.5] * theta) * 10000);
fprintf('Prediccion for 70000(7.0):\t%f\n', ([1, 7] * theta) * 10000);