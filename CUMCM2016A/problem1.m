clc;
clear;
%% 固定的参数
p_water = 1025; p_iron = 7900;g = 9.8; H = 18; 
% 浮标
m_buoy = 1000; r_buoy = 1; h_buoy = 2;
% 钢桶和设备
m_barrel = 100; r_barrel = 0.15; h_barrel = 1;
w_barrel = (m_barrel*g - p_water*g*pi*r_barrel^2*h_barrel)/h_barrel;
% 四节钢管,计算一节钢管
m_tube = 10; L_tube = 1; r_tube = 0.025;
w_tube = (m_tube*g - p_water*g*m_tube/p_iron)/L_tube;
%% 不确定参数有锚链的长度，锚链的型号和重物球的质量和风速
% 锚链的参数
L_chain = 22.05; m_per_chain = 7;
w0 = (L_chain*m_per_chain*g - p_water*g*L_chain*m_per_chain/p_iron)/L_chain;
% 重物球
m_ball = 1200;
w_ball = m_ball*g-p_water*g*m_ball/p_iron;
% 风速
syms v_wind
% v_wind = 12;
%% 首先计算临界风速的值
% 计算浮力,吃水深度,风力
F_buoyancy = m_buoy*g + 4*w_tube + w_barrel + w_ball + L_chain*w0;
h_depth = F_buoyancy/(p_water*g*pi*r_buoy^2);
F_wind = 0.625*2*r_buoy*(h_buoy-h_depth)*v_wind^2;
% 第一段锚链,积分等于22.05的坐标(x0,y0)
a1 = F_wind/w0;
syms x0 y0
equ1 = a1*sinh(x0/a1)-a1*sinh(0)-22.05;
equ2 = a1*cosh(x0/a1)-a1-y0;
% 第二段钢桶，积分等于1的坐标(x1,y1)
syms x1 y1` 
a2 = F_wind/w_barrel;
degree_barrel = atan((L_chain*w0+w_ball)/F_wind);
equ3 = a2*sinh((x1-x0)/a2+log((1+sin(degree_barrel))/cos(degree_barrel)))-a2*sinh(log((1+sin(degree_barrel))/cos(degree_barrel)))-1;
equ4 = a2*cosh((x1-x0)/a2+log((1+sin(degree_barrel))/cos(degree_barrel)))+y0-a2/cos(degree_barrel)-y1;
% 第三段钢管，积分等于4的坐标(x5,y5)
syms x5 y5
a3 = F_wind/w_tube;
degree_tube = atan((L_chain*w0+w_ball+w_barrel)/F_wind);
equ5 = a3*sinh((x5-x1)/a3+log((1+sin(degree_tube))/cos(degree_tube)))-a3*sinh(log((1+sin(degree_tube))/cos(degree_tube)))-4;
equ6 = a3*cosh((x5-x1)/a3+log((1+sin(degree_tube))/cos(degree_tube)))+y1-a3/cos(degree_tube)-y5;
equ7 = y5 + h_depth - H;
% [m1,m2,m3,m4,m5,m6,m7] = solve(equ1,equ2,equ3,equ4,equ5,equ6,equ7,v_wind,x0,y0,x1,y1,x5,y5);

