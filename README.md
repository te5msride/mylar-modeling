# Thermo-Active Soft Actuator Heat Modeling

## Introduction

Brief overview of the project.
Purpose and applications of the thermo-active soft actuator.
Overview of the modeling approach.

## Theoretical Background

### 1. Biot Number

Explain the significance of the Biot number in heat transfer modeling.

$B_i = h * L_c / k$

Criteria for 1-D assumption based on Biot number.

### 2. Lumped Capacitance Model

Description of the lumped capacitance model.
Conditions under which this model is applicable.
Energy balance equation:

$p * C_p * dT/dt = h * A * (T - T_inf) + \dot{q}$

## Peltier Device Modeling

### 1. Heat Addition and Removal

Role of the Peltier device in the actuator.
Explanation of heating ($\dot{q}_H$) and cooling ($\dot{q}_C$) modes.

### 2. Equation for Heat Addition ($\dot{q}_H$)

$\dot{q}_H = \text{n} (\alpha T_h I + \frac{1}{2} I^2 R - K(T_h - T_c))$

### 3. Equation for Heat Removal ($\dot{q}_C$)

$\dot{q}_C = \text{n} (\alpha T_c I - \frac{1}{2} I^2 R - K(T_h - T_c))$

#### Breakdown of each term in the equation.

$\dot{q}_H$: heat added to the system by the Peltier device (W)

$\text{n}$: Number of thermocouples in the Peltier device.

$\alpha$: Seebeck coefficient, a material property. (V/K)

$T_h$: hot side temperature (K)

$I$: current (A)

$R$: electrical resistance (Ohms)

$K$: thermal conductivity (W/K)

$T_c$: cold side temperature (K)

## Implementation in MATLAB

Overview of how the model will be implemented in MATLAB.
Description of required data inputs (material properties, device characteristics).
Brief on the numerical methods to be used (e.g., `ode45` for solving differential equations).

## Conclusion

Summary of the modeling approach.
Next steps: obtaining values, validating the model, etc.

## References

List any references or sources used in your modeling.
