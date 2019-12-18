function [theta, Js] = DescensoGradiente(X, y, theta, alpha, iteraciones)
    % Preparo Variables
    m = length(y);
    Js = zeros(iteraciones, 1);
    
    for i = 1 : iteraciones,
        h = X * theta;
        t1 = theta(1) - (alpha * (1 / m) * sum(h - y));
        t2 = theta(2) - (alpha * (1 / m) * sum((h - y) .* X(:, 2)));
        theta(1) = t1;
        theta(2) = t2;
        
        Js(i) = Costo(X, y, theta);
    end
end