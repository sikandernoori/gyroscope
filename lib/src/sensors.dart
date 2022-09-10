// ignore_for_file: constant_identifier_names

enum SensorType {
  ///  Accelerometer is a sensor that measures the device acceleration changes in three‑dimensional space. You can use this data to detect both the current orientation of the device (relative to the ground) and any instantaneous changes to that orientation.
  Accelerometer,

  ///  Gyroscope is a sensor that measures the device’s rate of rotation around each of the three spatial axes.
  Gyroscope,

  ///  Magnetometer (also known as Compass or Magnetic Field Sensor) is a sensor that measures the strength of the magnetic field surrounding the device.
  Magnetometer,

  ///  Device Motion sensor uses sensor fusion techniques to provide more advanced and accurate motion measurements. It measures the Attitude, Rotation Rate, Calibrated Magnetic Field, as well as a separation of User Acceleration and Gravity from the device’s acceleration.
  DeviceMotion,

  ///  Motion Activity sensor uses an embedded motion co‑processor that senses the user’s activity classified as Stationary, Walking, Running, Automotive or Cycling.
  MotionActivity,

  ///  Pedometer sensor uses an embedded motion co‑processor that captures pedestrian‑related data such as step counts, distance traveled and number of floors ascended or descended.
  Pedometer,

  ///  Altimeter sensor uses an embedded barometer sensor to capture changes to the relative altitude (not the actual). It also provides the recorded atmospheric pressure in kPa.
  Altimeter,

  ///  Battery sensor listens to changes in the battery charge state (Charging, Full, Unplugged) as well as in the battery charge level (with 1% precision).
  Battery,

  ///  Location sensor determines the current location of the device using a combination of Cellular, Wi‑Fi, Bluetooth and GPS sensors. It provides 2D geographical coordinate information (latitude, longitude), as well as the altitude of the device.
  Location,

  ///  Heading is a sensor that reports the device's orientation relative to magnetic and true north.
  Heading,

  ///  iBeacon™ Proximity sensor uses Apple's iBeacon™ technology to estimate the proximity of the current device with other iBeacons in range.
  iBeaconProximity,

  ///  Eddystone™ Proximity sensor estimates the proximity of the current device with other Eddystone™ beacons in range.
  EddystoneProximity,

  ///  Microphone sensor can be used to record audio from the environment (up to 4 hours) by converting sound into electrical signal.
  Microphone
}
