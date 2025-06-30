# Enhanced State Estimation Using Unobserved Variables using Kalman Filter

This folder contains MATLAB code for applying a Kalman filter to sensor data.



## Files
위치로 속도 추정
- `GetPos.m`: Raw Pos data reading
- `DvKalman.m`: Kalman filter logic
- `TestDvKalman.m`: Testing script

속도로 위치 추정 - 상태 변수(위치 속도)
- `GetVel.m`: Raw Velocity data reading
- `DvKalman2.m`: Kalman filter logic
- `TestDvKalman2.m`: Testing script

속도로 위치 추정2 - 상태 변수(위치 속도 가속도)
- `GetVel.m`: Raw Velocity data reading
- `DvKalman3.m`: Kalman filter logic
- `TestDvKalman3.m`: Testing script


## Output Example1 - 위치로 속도 추정하기
속도를 추정하는데 위치의 노이즈가 덤으로 줄어들음.
![image](https://github.com/user-attachments/assets/72ce11ed-ec74-460a-955f-5e4bf3be7d70)



## Output Example2 - 속도로 위치 추정하기
위치를 추정하는데 속도의 노이즈가 덤으로 줄어들음. State variables = [position velocity]
![image](https://github.com/user-attachments/assets/932a0b61-ad0d-4d7f-b3a1-26b687af1485)



## Output Example3 - 속도로 위치 추정하기
위치를 추정하는데 속도의 노이즈가 덤으로 줄어들음. State variables = [position velocity acceleration]

