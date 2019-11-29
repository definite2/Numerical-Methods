function [X,NGrad,it] = steepestDescent(fhandle,x0,tol,maxit)
% Description:
% Steepest descent method with exact line search
%
% Input:
%  fhandle: function handle, create it in another .m file. i.e.Rosenbrock
%  function, it should give at least function values and gradient at given
%  point x
%  
%
%  x0: initial point
%  tol: tolerance number, e.g.1e-3
%  maxit: maximum number of iterations
%
% Output:
%  X : min vector
% Ngrad:Norm of gradient vector
% it: iteration number
% Usage:
% [X,Grad,it]= steepestDescent(fhandle,x0,tol,maxit)

it = 1;

% Calculate function values at initial point
[~,fgrad] = feval(fhandle,x0);

NGrad(:,1)= norm(fgrad);

% Allocate initial point
x(:,1)=x0;

while( it<maxit && norm(fgrad)>tol) %when the norm of the gradient reaches to tol iteartion will stop
  
  % steepest descent direction
  p = -fgrad ;
  
  % Exact line search, step length
  alpha = fminbnd(@(alpha) fhandle(x(:,it)+alpha*p),0,1000); 
  
  % Update the point
  x(:,it+1)= x(:,it)+alpha*p; %%%%%%%%%
  
  % gradient at current point 
  [~,fgrad] = feval(fhandle,x(:,it+1));
  
  NGrad(:,it+1)=norm(fgrad);
  
  % Update the iterations
  it = it+1;
end
  X=x;
end