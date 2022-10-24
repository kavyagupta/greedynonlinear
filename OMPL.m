%OMP greedy algorithm for non linear sparse recovery
%this function returns a column vector recovered using OMP alogorithm.
%length(x)=size(A,2);
function x=OMPL(A,myfun,k)
o=[];   %support vectors
xinit=zeros(size(A,2),1);
x=xinit;
for i=1:2*k
    fun1 = @(x0) myfun(A,x0);   %function handle for ||y-f(x)||
    c=Grad(fun1,x);     %calculating the numerical gradient of ||y-f(x)|| to find the correlation
    [m ix]=max(abs(c)); %index with the max correlation.
    o=[o;ix];           %support update
    fun2 = @(x0) myfun(A(:,o),x0);
    b=fminunc(fun2,1*rand(length(o),1));   %min(||y-f(x)||)
    x = xinit;
    x(o) = b;
end
