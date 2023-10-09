% Energy Balance 1-D Geometry

% B_i = h*L_c/k < 0.1 --> 1-D Geometry

% L_c = V/A %thickness

k = 0.075 %W/mK for NOVEC 7000
L_c = 0.75 %mm
h = 5 %W/m^2K

% normalize units to m
L_c = L_c/1000


B_i = h*L_c/k

% Lumped Capacitance Model

% p*C_p*dT/dt = h*A*(T-T_inf) + q_dot

