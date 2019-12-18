data = load('examples.txt');

% Inicializo Matrices y Variables
X = data(:, 1);     % Matriz caracteristica
y = data(:, 2);  
[xx,yy]=meshgrid(X,y);
meshc(xx,yy,4-(xx.^(2)+yy.^(2))) 