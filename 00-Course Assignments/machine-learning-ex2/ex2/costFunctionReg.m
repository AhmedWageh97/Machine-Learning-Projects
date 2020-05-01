function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%   Calculating cost function
for i = 1 : m
    H_theta = sigmoid(X(i,:) * theta);
    J = J + ((-y(i) * log(H_theta)) - (1 - y(i)) *  log( 1 - H_theta));
end
J = (J / m) + ( (lambda * sum(theta(2:end).^2)) / (2 * m) );

%   Calculating gradient
for k = 1 : size(theta)
    Temp_Sum = 0;
    for i = 1 : m
        H_theta = sigmoid(X(i,:) * theta);
        Temp_Sum = Temp_Sum + (H_theta - y(i)) * X(i, k);
    end
    grad(k) = (sum(Temp_Sum) / m) + ((k ~= 1) * (lambda * theta(k) / m));
end


% =============================================================

end
