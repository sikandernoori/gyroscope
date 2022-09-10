import Foundation
import Flutter
import SensingKit

class GyroscopeStreamHandler: NSObject, FlutterStreamHandler{
    var sink: FlutterEventSink?
    var sensingKit: SensingKitLib?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print("GyroscopeStreamHandler onListen")
        sink = events
        let params: [String : Any] = arguments as! [String : Any]
        let type: UInt = params["sensorType"] as! UInt
        sensingKit = SensingKitLib.shared()
        let sensor = SKSensorType(rawValue: type) ?? SKSensorType.Gyroscope // TODO(skandar) support other sensors from SensKit using same code
        
        if (isSensorAvailable(sensorType: sensor)) {
            if(registerSensor(sensorType: sensor)){
                if(subscribeToSensor(sensorType: sensor)){
                    startStreaming(sensorType: sensor)
                }else{
                    print("Unable to subscribe to sensor \(sensor).")
                }
            }
            else{
                print("Unable to register sensor \(sensor).")
            }
        }else{
            print("Sensor \(sensor) not available.")
        }
        return nil
    }
    
    func isSensorAvailable(sensorType: SKSensorType) -> Bool{
        return sensingKit!.isSensorAvailable(sensorType)
    }
    
    func registerSensor(sensorType: SKSensorType) -> Bool {
        do {
            try sensingKit!.register(sensorType)
            return true
        }
        catch let error {
            
            let code = (error as NSError).code
            if let code = SKSensorError(rawValue: code) {
                switch code {
                case .sensorAlreadyRegisteredError:
                    return true
                default:
                    return false
                }
            }
            print(error.localizedDescription)
            // TODO(skandar) Handle other types of error too
            return false
        }
        
    }
    
    func subscribeToSensor(sensorType: SKSensorType)-> Bool{
        do {
            try sensingKit!.subscribe(to: sensorType, withHandler: { (sensorType, sensorData, error) in
                
                if (error == nil) {
                    
                    if(sensorData != nil && sensorData!.sensorType == SKSensorType.Gyroscope ){
                        self.sinkGyroscopeData(data: sensorData!)
                    } else{
                        //TODO(skandar) Hanlde other data types too.
                        print(sensorType.rawValue)
                    }
                }
                else{
                    // TODO(skandar) Handle error
                }
            })
            return true
        }
        catch {
            // TODO(skandar) Handle error
            return false
        }
    }
    
    func startStreaming(sensorType: SKSensorType){
        do {
            try sensingKit!.startContinuousSensing(with:sensorType)
        }
        catch {
            // TODO(skandar) Handle error
        }
    }
    
    func stopStreaming(sensorType: SKSensorType){
        do {
            try sensingKit!.stopContinuousSensing(with:sensorType)
        }
        catch {
            // TODO(skandar) Handle error
        }
    }
    
    func sinkGyroscopeData(data: SKSensorData){
        sink!(data.dictionaryData)
        //        let gyroscopeData = data as! SKGyroscopeData
        //        let dict = ["x": gyroscopeData.rotationRate.x, "y": gyroscopeData.rotationRate.y, "z": gyroscopeData.rotationRate.z]
        //        sink!(dict)
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("GyroscopeStreamHandler onCancel")
        let params: [String : Any] = arguments as! [String : Any]
        let type: UInt = params["sensorType"] as! UInt
        stopStreaming(sensorType: SKSensorType(rawValue: type) ?? SKSensorType.Gyroscope )
                sink = nil
        return nil
    }
}
