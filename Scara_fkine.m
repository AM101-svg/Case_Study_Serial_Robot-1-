syms a1 a2 d1 d4 q1 q2 d3 q4

L1=Link([q1,d1,a1,0,0]);
L2=Link([q2,0,a2,pi,0]);
L3=Link([0,q3,0,0,1]);
L4=Link([q4,d4,0,0,0]);

SCARA = SerialLink([L1 L2 L3 L4], 'name', 'SCARA')

T04= SCARA.fkine([q1 q2 q3 q4]);
T01= SCARA.fkine([q1 0 0 0]);
J=SCARA.jacob0([q1 q2 q3 0])

%% Kuka KR5 Jacobian_Fkine_Phi_XYZ %%%

syms q1 q2 q3 q4 q5 q6 a1 a2 a3 d1 d2 d3 d4 d6
L1=Link([q1,d1,a1,pi/2,0]);    % qn,d,a,alpha,offset %
L2=Link([q2,d2,a2,pi,0]);
L3=Link([q3,d3,a3,-pi/2,0]);
L4=Link([q4,d4,0,pi/2,0]);
L5=Link([q5,0,0,-pi/2,0]);          %% d5=0 %%
L6=Link([q6,d6,0,0,0]);
KUKA_KR5 = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'KUKA_KR5')
T06= KUKA_KR5.fkine([q1 q2 q3 q4 q5 q6])

J=KUKA_KR5.jacob0([q1 q2 q3 q4 q5 q6])

%%% nx ny nz ax ay oy ox %%%%

Phi_Z= atan2(- sin(q6)*(cos(q1)*cos(q4) + sin(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) - cos(q6)*(cos(q5)*(cos(q1)*sin(q4) - cos(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) + sin(q5)*(cos(q2)*sin(q1)*sin(q3) - cos(q3)*sin(q1)*sin(q2))),sin(q6)*(cos(q4)*sin(q1) - sin(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) + cos(q6)*(cos(q5)*(sin(q1)*sin(q4) + cos(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) - sin(q5)*(cos(q1)*cos(q2)*sin(q3) - cos(q1)*cos(q3)*sin(q2))))
Phi_Y= atan2(-(- cos(q6)*(cos(q2 - q3)*sin(q5) - sin(q2 - q3)*cos(q4)*cos(q5)) - sin(q2 - q3)*sin(q4)*sin(q6)),(sin(q6)*(cos(q4)*sin(q1) - sin(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) + cos(q6)*(cos(q5)*(sin(q1)*sin(q4) + cos(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) - sin(q5)*(cos(q1)*cos(q2)*sin(q3) - cos(q1)*cos(q3)*sin(q2))))*cos(Phi_Z)+(- sin(q6)*(cos(q1)*cos(q4) + sin(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) - cos(q6)*(cos(q5)*(cos(q1)*sin(q4) - cos(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) + sin(q5)*(cos(q2)*sin(q1)*sin(q3) - cos(q3)*sin(q1)*sin(q2))))*(sin(Phi_Z)))
Phi_X= atan2((- sin(q5)*(sin(q1)*sin(q4) + cos(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) - cos(q5)*(cos(q1)*cos(q2)*sin(q3) - cos(q1)*cos(q3)*sin(q2)))*sin(Phi_Z)-(sin(q5)*(cos(q1)*sin(q4) - cos(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) - cos(q5)*(cos(q2)*sin(q1)*sin(q3) - cos(q3)*sin(q1)*sin(q2)))*cos(Phi_Z),(sin(q6)*(cos(q5)*(cos(q1)*sin(q4) - cos(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))) + sin(q5)*(cos(q2)*sin(q1)*sin(q3) - cos(q3)*sin(q1)*sin(q2))) - cos(q6)*(cos(q1)*cos(q4) + sin(q4)*(sin(q1)*sin(q2)*sin(q3) + cos(q2)*cos(q3)*sin(q1))))*cos(Phi_Z)-(cos(q6)*(cos(q4)*sin(q1) - sin(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) - sin(q6)*(cos(q5)*(sin(q1)*sin(q4) + cos(q4)*(cos(q1)*cos(q2)*cos(q3) + cos(q1)*sin(q2)*sin(q3))) - sin(q5)*(cos(q1)*cos(q2)*sin(q3) - cos(q1)*cos(q3)*sin(q2))))*sin(Phi_Z))


ws = [-2 2 -2 2 -2 2];
plot_options = {'workspace',ws};

a1=250;
a2=150;
d1=300;
d4=50;