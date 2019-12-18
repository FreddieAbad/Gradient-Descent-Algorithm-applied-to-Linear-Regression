function J = Costo(X, y, theta)
    m = length(y);
    
    % Calculo Hipotesis
    h = X * theta;
    
    % Calculo del Costo
    J = 1 / (2 * m) * sum((h - y) .^ 2);
end