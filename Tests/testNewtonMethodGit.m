close all
x=[1.2,1.2];
tol=1.0e-2;
maxit=1000;

[X,Grad,it] = newtonMethod(@Beale,x,tol,maxit);


plot(1:it,Grad,'d-')
xlabel('iteration number','fontsize',18)
ylabel('Norm of Gradient','fontsize',18)
title('Newton Method','fontsize',18)