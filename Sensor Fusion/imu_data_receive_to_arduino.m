% 시리얼 포트 설정
port = serialport("COM4", 115200);  % 포트는 실제 연결된 번호로 수정
configureTerminator(port, "LF");

% 데이터 저장용 배열
accel_data = [];
gyro_data = [];
mag_data = [];

% 시간 측정 시작
t_start = tic;
duration = 5;  % 초

while toc(t_start) < duration
    try
        line = readline(port);
        data = str2double(split(line, ","));
        if numel(data) == 9
            accel_data(end+1, :) = data(1:3);
            gyro_data(end+1, :)  = data(4:6);
            mag_data(end+1, :)   = data(7:9);
        end
    catch
        % 데이터 손실이나 파싱 에러 방지
        continue
    end
end

% CSV 파일로 저장
writematrix(accel_data, 'acc.csv');
writematrix(gyro_data,  'gyro.csv');
writematrix(mag_data,   'mag.csv');

disp("✅ 센서 데이터 저장 완료: acc.csv / gyro.csv / mag.csv");
