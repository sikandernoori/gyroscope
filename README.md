# gyroscope

A Flutter plugin to use Gyroscope in flutter using Android and IOS native.

## Getting Started

## Usage
```
GyroscopeSensorImpl gyro = GyroscopeSensorImpl();

gyro.subscribe(data, rate: SampleRate.fastest);

gyro.unsubscribe();
```
## Permissions.

(IOS) add sensor permission in info.plist

    - NSMotionUsageDescription


TODO:
 - [ ] Handle Exeptions Dart
 - [ ] Handle Exeptions IOS
 - [ ] Convert Code to Streams instead of callback
 - [ ] Implement Android
 - [ ] Implement other supprted sensors by Senskit
 - [ ] Improve documentation.
