import Flutter
import UIKit


public class SwiftGyroscopePlugin: NSObject, FlutterPlugin  {
  public static func register(with registrar: FlutterPluginRegistrar) {      
      let eventChannel = FlutterEventChannel(name: "gyroscope", binaryMessenger: registrar.messenger())
      let gyroscopeStreamHandler = GyroscopeStreamHandler()
      eventChannel.setStreamHandler(gyroscopeStreamHandler)
  }
}


// public class SwiftGyroscopePlugin: NSObject, FlutterPlugin,  {
//   public static func register(with registrar: FlutterPluginRegistrar) {
//     let channel = FlutterMethodChannel(name: "gyroscope", binaryMessenger: registrar.messenger())
//     let instance = SwiftGyroscopePlugin()
//     registrar.addMethodCallDelegate(instance, channel: channel)
//   }

//   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//     result("iOS " + UIDevice.current.systemVersion)
//   }
// }
