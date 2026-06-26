a1=250;a2=150;d1=300;d4=50;
theta1=linspace(-120,120,100)*pi/180;
theta2=linspace(-130,130,100)*pi/180;
d3=linspace(0,150,100);
theta4=linspace(-360,360,100)*pi/180;
[T1,T2,D3]=ndgrid(theta1,theta2,d3); % if t4 incoporate then Add t4 here
xM = round((a2*cos(T1 + T2) + a1*cos(T1))); % and use it in x y z as T4
yM = round((a2*sin(T1 + T2) + a1*sin(T1)));
zM = round(( d1 - D3 - d4));
plot3(xM(:),yM(:),zM(:),'.')