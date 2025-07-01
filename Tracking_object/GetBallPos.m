function [xc, yc] = GetBallPos(index)

persistent imgBg
persistent firstRun truePos

if isempty(firstRun)
    imgBg = uint8(255 * ones(480, 640, 3));  % 흰 배경 (480x640)
    firstRun = 1;

    % 공의 실제 위치 초기화 (0,0부터 시작)
    truePos = [0; 0];
end

% 공의 실제 위치 업데이트 (프레임마다 오른쪽 아래로 이동)
truePos = truePos + [5; 2];  % x는 +5, y는 +2씩 증가

x_true = truePos(1);
y_true = truePos(2);

% 공을 배경에 그림
imgWork = imgBg;  % 배경 복사
radius = 10;

[cols, rows] = meshgrid(1:640, 1:480);  % 배경 크기 기준
mask = (rows - y_true).^2 + (cols - x_true).^2 <= radius^2;
for c = 1:3
    channel = imgWork(:,:,c);
    channel(mask) = 0;  % 검은색 공
    imgWork(:,:,c) = channel;
end

imshow(imgWork); drawnow;  % 영상 시각화

% 배경 차이로 공 영역 검출
fore = imabsdiff(imgWork, imgBg);
fore = (fore(:,:,1) > 10) | (fore(:,:,2) > 10) | (fore(:,:,3) > 10);

L = logical(fore);
stats = regionprops(L, 'Area', 'Centroid');

xc = 0;
yc = 0;

if ~isempty(stats)
    % 가장 큰 객체의 중심 사용
    area_vector = [stats.Area];
    [~, idx] = max(area_vector);
    centroid = stats(idx(1)).Centroid;

    % 검출된 위치에 노이즈 추가해서 반환
    xc = centroid(1) + randn * 5;  % 노이즈 ±5 정도
    yc = centroid(2) + randn * 5;
end
