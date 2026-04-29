%% Section 1- Parameters
g=9.81; %gravity (m/s^2)
mu_true= 0.8; %true road friction
t=0:0.01:10;
v0=25;
%% Section 2- Vehicle Braking
a_true = -mu_true*g;
v=v0+a_true*t;
v(v<0)=0;
%% Section 3- Adding noise
a_measured=a_true+0.5*rand(size(t));
%% Section 4-Plot Acceleraton
figure;
plot(t,a_measured,'r')
hold on
plot(t,a_true*ones(size(t)),'b','LineWidth',2)

xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
title('True vs Measured Acceleration')
legend('Measured', 'True')
grid on
%% Section 5- Kalman Filter Model
A=0;
B=0;
C=-g;
D=0;
sys=ss(A,B,C,D);
%%Section 6- Kalman filter design
G=1; %process noise enters mu
sys_kf=ss(A,G,C,D);
Qn=0.01; %process noise 
Rn=0.25; %measurement noise
[kalmf,L,P]=kalman(sys_kf,Qn,Rn);
%% Section 7 - Simulate Kalman Filter

mu0_est = 0.5;   % initial guess for friction

[y_est, t_est, x_est] = lsim(kalmf, a_measured, t, mu0_est);

mu_est = x_est;  % estimated friction coefficient
%% Section 8 - Compare True vs Estimated Friction

figure;
plot(t, mu_true * ones(size(t)), 'b', 'LineWidth', 2)
hold on
plot(t_est, mu_est, 'r--', 'LineWidth', 2)

xlabel('Time (s)')
ylabel('Friction Coefficient (\mu)')
title('True vs Estimated Friction Coefficient')
legend('True \mu', 'Estimated \mu')
grid on