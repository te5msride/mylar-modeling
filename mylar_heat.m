% Thermo-Active Soft Actuator Heat Modeling

% Constants and Parameters
k = 0.075; % Thermal conductivity of NOVEC 7000 [W/mK]
L_c = 0.75 / 1000; % Thickness of the fluid layer [m]
h = 5; % Convective heat transfer coefficient [W/m^2K]

% Peltier Device Parameters
n = 126; % Number of thermocouples in the Peltier device
alpha = 225e-6; % Seebeck coefficient [V/K] for Bismuth Telluride (Placeholder)
I = 5; % Current [A]
R = 2; % Electrical resistance [Ohms] (Placeholder)
K = 2; % Thermal conductivity [W/mK] (Placeholder)
T_h = 333; % Hot side temperature [K] (Estimated)
T_c = 293; % Cold side temperature [K] (Estimated)
T_inf = 293; % Ambient temperature [K]
A = 0.0004; % Surface area [m^2]
p = 1700; % Density of NOVEC 7000 [kg/m^3] (Placeholder)
C_p = 1100; % Specific heat capacity [J/kgK] (Placeholder)

% Biot Number Calculation
B_i = h * L_c / k;

% Check if Biot Number is less than 0.1 for 1-D assumption
if B_i < 0.1
    disp('1-D assumption is valid');
else
    disp('1-D assumption may not be valid');
end

% Define the time span and initial condition for the temperature
timeSpan = [0 10]; % From 0 to 10 seconds
T_initial = 293; % Initial temperature of the fluid in Kelvin

% Call ode45 with an anonymous function
[Times, Temperatures] = ode45(@(t, T) heatModel(t, T, I, T_h, T_c, n, alpha, R, K, h, A, p, C_p, T_inf), timeSpan, T_initial);

% Define the ODE function
function dTdt = heatModel(t, T, I, T_h, T_c, n, alpha, R, K, h, A, p, C_p, T_inf)
    % Calculate q_dot_H and q_dot_C based on current values
    q_dot_H = n * (alpha * T_h * I + 0.5 * I^2 * R - K * (T_h - T_c));
    q_dot_C = n * (alpha * T_c * I - 0.5 * I^2 * R - K * (T_h - T_c));

    % Energy Balance Equation for Lumped Capacitance Model
    dTdt = (h * A * (T - T_inf) + q_dot_H) / (p * C_p);
end
