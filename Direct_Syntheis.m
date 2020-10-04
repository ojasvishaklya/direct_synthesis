s = tf('s');

%Plant transfer function
k=1;
t=1;
Gp = k/(t*s+1);
sys1 = feedback(Gp,1);

%Required transfer function
l=1; %Lambda
Gr=1/(l*s+1)^2

%Controller : Gc=Gr/(Gm*(1-Gr))


step(sys1,'-b'), hold on;
grid on;

for l=1:10
 
Kp=t/(k*l);
Gc=pid(Kp,Kp/t,0,0);
Lpf=1/(l*s+2);
sys2=feedback(Gc*Lpf*Gp,1);

step(sys2);
    
end
 Legend=cell(11,1);
 Legend{1}=strcat('Without Control');
 for iter=2:11
   Legend{iter}=strcat('Lambda : ', num2str(iter-1));
 end
 legend(Legend)
