function [ f,gradf,hessian ] = rosenbrock(x)

% Description:
% Calculates Rosenbrock function values, gradient and hessian at given point x
%
% Input:
%  x: given point
%
% Output:
%  f: Rosenbrock function at point x
%  gradf: gradient of Rosenbrock fuction at point x
%  hessian: hessian of Rosenbrock function at point x
%
% Example usage:
% [f,~,~] = rosenbrock(x)

f     = 100*(x(1)^2 - x(2))^2 + (x(1)-1)^2;
gradf = [100*(2*(x(1)^2-x(2))*2*x(1)) + 2*(x(1)-1)...
         ;100*(-2*(x(1)^2-x(2)))];
hessian=[-400*x(2)+1200*x(1)^2+2, -400*x(1)  ...
        ; -400*x(1), 200] ;

end