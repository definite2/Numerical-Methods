function [X,NGrad,it] = newtonMethod(fhandle,x0,tol,maxit)
%Description
% Newton method requires f, grad and hessian also herefore fhandle should give f, grad ve hessian values,
%Inputs

%fhandle: its output should be like this..> [f,g,h]=fhandleName(x)
%x0: initial point
%tol: tolerance number reqired for convergence, in order to stop iteration
%maxit: maximum number of iteration

%Outputs:
%[X]= min points stored in here where the last value is the
%minimum(local/global?)
%NGrad: norm of gradient( should be converge to 0/tol number)
%it: stop it number
%hessian
it=1;

x(:,1)=x0;
[~,grad,hes]=feval(fhandle,x0);
NGrad(:,1)=norm(grad);

while(it<maxit && norm(grad)>tol)
  
    % search direction, p:
    p=-inv(hes)*grad;
    
    %step length is 1 in this method:
    alpha=1;
    
    %update point:
    x(:,it+1)=x(:,it)+alpha.*p;
    
    %recalculate grad, hessian at new point:
    [~,grad,hes]=feval(fhandle,x(:,it+1));
    
    %update norm of grad:
    NGrad(:,it+1)=norm(grad);
    
        
    it=it+1;
    
    
end
X=x;
end