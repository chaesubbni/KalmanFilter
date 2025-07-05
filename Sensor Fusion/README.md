# Sensor fusion using Kalman Filter

This folder handles accelerometer, gyroscope, and magnetometer data from the Arduino Nano 33 BLE by transmitting the sensor data from the Arduino program to MATLAB via serial communication for processing.



## Files
상태변수 위치, 속도를 이용해 위치 추정.
- `imu_data_receive_to_arduino.m`: recevie sensor data by arduino serial and download them
- `imu_dataa_transmission_to_matlab`: transmission sensor data to matlab




- ## Output Example

sensor data 

![image](https://github.com/user-attachments/assets/81c7cdbd-67f2-4978-9eee-4c95106e771b)


![image](https://github.com/user-attachments/assets/19ad7b05-3079-4f2d-9209-c955d3055d98)

