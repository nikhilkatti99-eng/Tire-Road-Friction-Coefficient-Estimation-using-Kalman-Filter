%% Section 1- Parameters
m=1500; % vehicle mass
g=9.81; % gravity(m/s^2)
mu_true= 0.8; % actual friction coefficient on dry road
t=0:0.01:10; % simulation time
v0=25; %initial speed(m/s)
%% Section 2 - Vehicle speed simulation
a=-mu_true*g;
v=v0+a*t;
v(v < 0)= 0;
%% Section 3- Plot vehcile speed
plot(t,v,'LineWidth',2)
xlabel('Time(s)')
ylabel('Vehicle speed(m/s)')
title('Vehicle Braking')
grid on
%% Section 4- Adding noise to the speed
noise=0.5*randn(size(v)); % random sensor noise
v_measured= v + noise; 
v_measured(v_measured<0)=0;
%% Section 5 - Compare true vs measured speed
figure;
plot(t,v,'b','LineWidth',2)
hold on
plot (t,v_measured,'r--')
xlabel('Time(s)')
ylabel('Vehicle Speed(m/s)')
title('True vs measured speed')
grid on
%% Section 6 - State space model
A=[0 -g;
    0 0];
B=[0;
    0];
C=[1 0];
D=0;
sys=ss(A,B,C,D);
%% Section 7- Kalman filter design
G=eye(2)
sys_kf= ss(A,G,C,zeros(1,2));

Qn=0.1*eye(2); 
Rn=0.2;
[kalmf,L,P]=kalman(sys_kf,Qn,Rn);
%% Section 8- Kalman filter simulation
x0_est=[25;0.6]; % initial guess for speed and friction- tuning the model because the friction was going negative
%input to Kalman filter = noisy speed measurement
[y_est,t_est,x_est]= lsim(kalmf,v_measured,t);
%Estimated states
v_est=x_est(:,1); 
mu_est=x_est(:,2);
%% Section 9 - Compare True vs Estimated Friction

figure;
plot(t, mu_true * ones(size(t)), 'b', 'LineWidth', 2)
hold on
plot(t_est, mu_est, 'r--', 'LineWidth', 2)

xlabel('Time (s)')
ylabel('Friction Coefficient (\mu)')
title('True vs Estimated Friction Coefficient')
legend('True \mu', 'Estimated \mu')
grid on
