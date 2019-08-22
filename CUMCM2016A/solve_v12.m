function f = solve_v12(x)
x0=x(2); y0=x(3); x1=x(4); y1=x(5);x2=x(6); y2=x(7);x3=x(8); y3=x(9);x4=x(10); y4=x(11);x5=x(12); y5=x(13);
p_water = 1025; p_iron = 7900;g = 9.8; H = 18; 
m_buoy = 1000; r_buoy = 1; h_buoy = 2;
m_barrel = 100; r_barrel = 0.15; h_barrel = 1;
w_barrel = m_barrel*g - p_water*g*pi*r_barrel^2*h_barrel;
m_tube = 10; L_tube = 1; r_tube = 0.025;
w_tube = m_tube*g - p_water*g*m_tube/p_iron;
L_chain = x(1); m_per_chain = 7;
w0 = (L_chain*m_per_chain*g - p_water*g*L_chain*m_per_chain/p_iron)/L_chain;
m_ball = 1200;
w_ball = m_ball*g-p_water*g*m_ball/p_iron;
v_wind = 12;
F_buoyancy = m_buoy*g + 4*w_tube + w_barrel + w_ball + L_chain*w0;
h_depth = F_buoyancy/(p_water*g*pi*r_buoy^2);
F_wind = 0.625*2*r_buoy*(h_buoy-h_depth)*v_wind^2;
a1 = F_wind/w0;
f(1) = a1*sinh(x0/a1)-a1*sinh(0)-L_chain;
f(2) = a1*cosh(x0/a1)-a1-y0;
a2 = F_wind/w_barrel;
degree_barrel = atan((L_chain*w0+w_ball)/F_wind);
f(3) = a2*sinh((x1-x0)/a2+log((1+sin(degree_barrel))/cos(degree_barrel)))-a2*sinh(log((1+sin(degree_barrel))/cos(degree_barrel)))-1;
f(4) = a2*cosh((x1-x0)/a2+log((1+sin(degree_barrel))/cos(degree_barrel)))+y0-a2/cos(degree_barrel)-y1;

a3 = F_wind/w_tube;
degree_tube1 = atan((L_chain*w0+w_ball+w_barrel)/F_wind);
f(5) = a3*sinh((x2-x1)/a3+log((1+sin(degree_tube1))/cos(degree_tube1)))-a3*sinh(log((1+sin(degree_tube1))/cos(degree_tube1)))-1;
f(6) = a3*cosh((x2-x1)/a3+log((1+sin(degree_tube1))/cos(degree_tube1)))+y1-a3/cos(degree_tube1)-y2;

a4 = F_wind/w_tube;
degree_tube2 = atan((L_chain*w0+w_ball+w_barrel+w_tube)/F_wind);
f(7) = a4*sinh((x3-x2)/a4+log((1+sin(degree_tube2))/cos(degree_tube2)))-a4*sinh(log((1+sin(degree_tube2))/cos(degree_tube2)))-1;
f(8) = a4*cosh((x3-x2)/a4+log((1+sin(degree_tube2))/cos(degree_tube2)))+y2-a4/cos(degree_tube2)-y3;

a5 = F_wind/w_tube;
degree_tube3 = atan((L_chain*w0+w_ball+w_barrel+w_tube*2)/F_wind);
f(9) = a5*sinh((x4-x3)/a5+log((1+sin(degree_tube3))/cos(degree_tube3)))-a5*sinh(log((1+sin(degree_tube3))/cos(degree_tube3)))-1;
f(10) = a5*cosh((x4-x3)/a5+log((1+sin(degree_tube3))/cos(degree_tube3)))+y3-a5/cos(degree_tube3)-y4;

a6 = F_wind/w_tube;
degree_tube4 = atan((L_chain*w0+w_ball+w_barrel+w_tube*3)/F_wind);
f(11) = a6*sinh((x5-x4)/a6+log((1+sin(degree_tube4))/cos(degree_tube4)))-a6*sinh(log((1+sin(degree_tube4))/cos(degree_tube4)))-1;
f(12) = a6*cosh((x5-x4)/a6+log((1+sin(degree_tube4))/cos(degree_tube4)))+y4-a6/cos(degree_tube4)-y5;
f(13) = y5 + h_depth - H;
end
