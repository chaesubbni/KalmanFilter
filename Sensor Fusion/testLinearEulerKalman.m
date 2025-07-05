clear all
delete(instrfindall); % 혹시 시리얼이 다른 곳에서 열려 있으면 종료

Nsamples = 400;
EulerSaved = zeros(Nsamples, 3);

dt = 0.01;

for k = 1:Nsamples
    [accel, gyro, mag] = imu_read();
    p = gyro(1);
    q = gyro(2);
    r = gyro(3);
    A = eye(4) + dt*1/2*[0 -p -q -r; 
                         p 0 r -q; 
                         q -r 0 p; 
                         r q -p 0];
    ax = accel(1);
    ay = accel(2);
    az = accel(3);
    [phi, theta] = LinearEulerAccel(ax,ay,az);
    z = EulerToQuaternion(phi,theta, 0);

    [phi, theta, psi] = LinearEulerKalman(A,z);
    EulerSaved(k,:) = [phi theta psi];
    pause(dt)
end

PhiSaved = EulerSaved(:,1) * (180/pi);
ThetaSaved = EulerSaved(:,2) * (180/pi);
PsiSaved = EulerSaved(:,3) * (180/pi);

t = 0:dt:Nsamples*dt-dt;

figure
plot(t, PhiSaved)

figure
plot(t, ThetaSaved)