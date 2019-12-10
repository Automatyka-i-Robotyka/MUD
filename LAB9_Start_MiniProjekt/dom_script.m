c_p=1000;%J*K/kg
ro_p=1.2;%kg/m^3
T_wew=21;%C'
T_pn=19;%C'
T_zewn=-1;%C'
f_pn=1;
T_zn=24;%C'
h=3;%m
a=6;%m
V_gp=(a^2)*h;%m^3
V_pp=(1/3)*V_gp;%m^3
C_vw=c_p*ro_p*V_gp;
C_vp=c_p*ro_p*V_pp;
% K_1=50;
% K_w=50;
% K_p=5;
T_wew_0=21;
T_p_0=18;
% T_wew_st = (c_p*ro_p*f_pn
% liczba = 4; %proporcja kp do kw
% A = [T_wew-T_pn, T_wew-T_zewn;
%     T_wew-T_pn, -(T_pn-T_zewn)/liczba];
% B = [c_p*ro_p*f_pn*(T_zn-T_wew); 0];
% 
% x = inv(A)*B
% K_1=x(1,1);
% K_w=x(2,1);
% K_p=(1/liczba)*K_w;
