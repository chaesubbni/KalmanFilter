function [accel_var, gyro_var] = calcurate_sensor_noise()

ts = tic; 
stopTimer = 5; 
accel=[];
gyro=[];

%정지값으로 측정.
while(toc(ts) < stopTimer) 
   [a,g,m] = imu_read(); 
    accel = [accel;a];
    gyro = [gyro;g];
end 

%가속도 센서 측정값
%운동 가속도 + 중력 가속도 + 편향 + 노이즈
%정지해 있으니 운동 가속도는 0
%분산은 곧 노이즈 R
accel_var = var(accel);

%자이로 센서 측정값
%각속도
%분산은 곧 노이즈 R
gyro_var = var(gyro);