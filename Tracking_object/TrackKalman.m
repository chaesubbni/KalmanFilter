function [xh, yh] = TrackKalman(xm,ym)

persistent A H Q R
persistent x P
persistent firstRun


if isempty(firstRun)
    dt = 1;
    A = [1 dt 0 0;
         0 1 0 0;
         0 0 1 dt;
         0 0 0 1];
    
    %측정값은 이제 위치 x,y니깐 H를 2x4로 설정.
    H = [1 0 0 0;
         0 0 1 0];

    Q = 1.0 * eye(4);
    R = 50 * eye(2);

    x = [0 0 0 0]';
    P = 100 * eye(4);
    firstRun = 1;
end

xp = A*x;
Pp = A*P*A' + Q;

K = Pp*H' / (H*Pp*H' + R);

z = [xm ym]';
x = xp + K*(z - H*xp);
P = Pp-K*H*Pp;

xh = x(1);
yh = x(3);