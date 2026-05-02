# Tire-Road Friction Coefficient Estimation using Kalman Filter

## Project Overview

This project focuses on estimating the tire-road friction coefficient (μ) using Kalman Filter based observer design in MATLAB.

The friction coefficient is one of the most important parameters in vehicle braking systems because it determines the available tire grip between the road and the tire. It directly affects the performance of systems such as:

- ABS (Anti-lock Braking System)
- ESC (Electronic Stability Control)
- Traction Control
- Autonomous Emergency Braking

Since the friction coefficient cannot be directly measured using a physical sensor, it must be estimated using vehicle measurements and mathematical models.

This project was developed in two phases:

- Phase 1: Speed-based friction estimation
- Phase 2: Acceleration-based friction estimation

---

## Objective

To design a state-space observer using a Kalman Filter for estimating the tire-road friction coefficient under noisy sensor conditions.

---

## Phase 1: Speed-Based Friction Estimation

### Theory

The vehicle braking model is based on:

dv/dt = -μg

Where:

- v = vehicle speed  
- μ = friction coefficient  
- g = gravitational acceleration  

The state vector is:

x = [v  
     μ]

---

### Observation

The speed-based model showed estimation drift near zero velocity due to weak observability.

---

## Phase 2: Acceleration-Based Friction Estimation

### Theory

a = -μg  

μ = -a/g  

Where:

- a = vehicle acceleration  

The state is:

x = [μ]

Measurement equation:

y = -gμ

---

### Result

The acceleration-based model shows stable convergence of estimated friction coefficient toward the true value.

---

## MATLAB Files

### friction_estimation_speed.m

- Speed-based model  
- Noisy speed simulation  
- Kalman filter implementation  

### friction_estimation_acceleration.m

- Acceleration-based model  
- Noisy acceleration simulation  
- Improved Kalman filter  

---

## Key Learnings

- State-space modeling  
- Kalman filter design  
- Observability concepts  
- Sensor noise handling  
- Model improvement through iteration  

---

## Applications

- Brake control systems  
- ABS development  
- Vehicle dynamics simulation  
- Automotive control systems  

---

## Tools Used

- MATLAB  
- Control System Toolbox  
- State-space modeling  
- Kalman filtering  
