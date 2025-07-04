port = serialport("COM4", 115200);  % 포트 번호는 환경에 따라 다름
configureTerminator(port, "LF");

while true
    line = readline(port);
    data = str2double(split(line, ","));
    if numel(data) == 9
        accel = data(1:3);
        gyro  = data(4:6);
        mag   = data(7:9);

        % 여기에서 Madgwick 등 필터 적용 가능
        disp([accel, gyro, mag]);  % 확인용 출력
    end
end
