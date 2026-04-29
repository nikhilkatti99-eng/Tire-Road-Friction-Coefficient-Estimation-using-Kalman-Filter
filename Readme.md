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

The second phase improves estimation robustness by addressing observability limitations found in the first model.

---

## Objective

To design a state-space observer using a Kalman Filter for estimating the tire-road friction coefficient under noisy sensor conditions.

---

# Phase 1: Speed-Based Friction Estimation

## Theory

The vehicle braking model is based on:

```text
dv/dt = -μg
