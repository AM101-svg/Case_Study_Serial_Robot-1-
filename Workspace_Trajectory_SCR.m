a1=250;a2=150;d1=300;d4=50;
syms q1 q2 q3 q4
T1=Link([q1,300,250,0,0]);
T2=Link([q2,0,150,pi,0]);
D3=Link([0,q3,0,0,1]);
T4=Link([q4,50,0,0,0]);
SCARA = SerialLink([T1 T2 D3 T4], 'name', 'SCARA')
theta1=linspace(-120,120,15)*pi/180;
theta2=linspace(-130,130,15)*pi/180;
d3=linspace(0,150,10);
theta4=linspace(-360,360,15)*pi/180;
[T1,T2,D3]=ndgrid(theta1,theta2,d3); % if t4 incoporate then Add t4 here - in these Case, t4 has no effect on the END Effector Pose
xM = round((a2*cos(T1 + T2) + a1*cos(T1))); % and use it in x y z as T4
yM = round((a2*sin(T1 + T2) + a1*sin(T1)));
zM = round((d1 - D3 - d4));
Workspace = plot3(xM(:),yM(:),zM(:),'.')

t=[0:0.01:4.5];         %%%%% 1 Case : [pi/4 3*pi/4 5*pi/4 7*pi/4]      %%%%%% 2 Case : [0 pi/2 pi 3*pi/2 2*pi]                 
qA=[0 0 0 0];
qAB=[pi/4 3*pi/4 5*pi/4 7*pi/4]; 
M=jtraj(qA,qAB,t);
T = SCARA.fkine(M);
array = transl(T);

x=squeeze(array(1:451));
y=squeeze(array(452:902));
z=squeeze(array(903:1353));
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Z (mm)');
plot3(x,y,z);