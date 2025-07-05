function [accel, gyro, mag] = imu_read()
    persistent port
    if isempty(port)
        port = serialport("COM4", 115200);
        configureTerminator(port, "LF");
    end

    line = readline(port);
    data = str2double(split(line, ","));

    if numel(data) == 9
        accel = data(1:3)';
        gyro  = data(4:6)';
        mag   = data(7:9)';

        % 여기에서 Madgwick 등 필터 적용 가능
        disp([accel; gyro; mag]);  % 확인용 출력
    end
end