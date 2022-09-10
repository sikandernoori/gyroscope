import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gyroscope/src/exceptions.dart';

import 'gyroscope_data.dart';
import 'gyroscope_sensor_interface.dart';
import 'sample_rate.dart';
import 'sensors.dart';

class GyroscopeSensorImpl implements GyroscopeSensorInterface {
  final _eventChannel = const EventChannel('gyroscope');
  late StreamSubscription streamSubscription;
  late Timer timer;

  @override
  Future<void> subscribe(
    GyroscopeSensorSubscription subscription, {
    SampleRate rate = SampleRate.normal,
    SensorType sensorType = SensorType.Gyroscope,
  }) async {
    try {
      Map? sensorData;
      final stream =
          _eventChannel.receiveBroadcastStream(_getArguments(sensorType));

      streamSubscription = stream.listen((event) {
        var data = event as Map;
        if (data['sensorType'] == 1) // Gyroscope data
        {
          sensorData = data;
        }
      }, onError: (error) {
        //TODO(skandar) Handle error
      });

      timer = Timer.periodic(
          Duration(milliseconds: (1000 / rate.toHz()).floor()), (Timer t) {
        if (sensorData != null) {
          subscription(GyroscopeData.fromJson(sensorData!));
        }
      });
    } catch (_) {
      //TODO(skandar) Implemenet different types of exceptions.
      throw SensorException();
    }
  }

  @override
  Future<void> unsubscribe() async {
    timer.cancel();
    streamSubscription.cancel();
  }

  _getArguments(SensorType sensorType) => {"sensorType": sensorType.index};
}
