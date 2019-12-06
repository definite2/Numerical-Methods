close all
x=[1.2,1.2];
tol=1.0e-2;
maxit=1000;

[X,Grad,it] = steepestDescent(@rosenbrock,x,tol,maxit);

%figure(2)
plot(1:it,Grad,'o-')
xlabel('iterations','fontsize',18)
ylabel('Norm of Gradient','fontsize',18)
title('Steepest Descent','fontsize',18)