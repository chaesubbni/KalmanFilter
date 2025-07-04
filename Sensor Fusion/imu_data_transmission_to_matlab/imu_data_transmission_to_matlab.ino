#include <Arduino_BMI270_BMM150.h>
#include <math.h>

void setup() {
  Serial.begin(115200);
  while (!Serial); // USB 연결 기다림

  if (!IMU.begin()) {
    Serial.println("Failed to initialize IMU!");
    while (1);
  }
}

void loop() {
  float ax, ay, az;
  float gx, gy, gz;
  float mx, my, mz;

  if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(ax, ay, az);
  }

  if (IMU.gyroscopeAvailable()) {
    IMU.readGyroscope(gx, gy, gz);
  }

  if (IMU.magneticFieldAvailable()) {
    IMU.readMagneticField(mx, my, mz);
  }

  // CSV 형태로 출력 → MATLAB에서 읽기 편함
  Serial.print(ax); Serial.print(',');
  Serial.print(ay); Serial.print(',');
  Serial.print(az); Serial.print(',');
  Serial.print(gx); Serial.print(',');
  Serial.print(gy); Serial.print(',');
  Serial.print(gz); Serial.print(',');
  Serial.print(mx); Serial.print(',');
  Serial.print(my); Serial.print(',');
  Serial.println(mz);  // 끝에 줄바꿈

  delay(10); // 약 100Hz 주기
}
