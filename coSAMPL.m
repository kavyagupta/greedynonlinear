%COSAMP greedy algorithm for non linear sparse recovery
%this function returns a column vector x recovered using cOSAMP alogorithm.
%length(x)=size(A,2);
function x=coSAMPL(A,k,myfun)
o=[]; %support vectors
xinit=zeros(size(A,2),1);
x=xinit;
 for i=1:2*k
    fun1 = @(x0) myfun(A,x0);%function handle for ||y-f(x)||
    c=Grad(fun1,x);   %calculating the numerical gradient of ||y-f(x)|| to find the correlation
    [m n]=sort(abs(c),'descend');
    ix=n(1:2*k); %select top 2k values of c.
    o=[o;ix];%update support
    fun2 = @(x0) myfun(A(:,o),x0);
    b=fminunc(fun2,1*rand(length(o),1));%min(||y-f(x)||)
    [p q]=sort(abs(b),'descend');
    oin=q(1:k);%select top k values
    x1=b(oin);
    o=o(oin);
    x=xinit;
    x(o)=x1;
  end