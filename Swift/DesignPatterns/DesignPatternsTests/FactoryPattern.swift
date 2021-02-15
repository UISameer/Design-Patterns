import XCTest
@testable import DesignPatterns

class FactoryPattern: XCTestCase {
    
    func testFactoryMethodRealWorld() {
        
        let info = "Very important info of the presentation"
        
        let clientCode = ClientCode()
        
        /// Present info over WiFi
        clientCode.present(info: info, with: WifiFactory())
        
        /// Present info over Bluetooth
        clientCode.present(info: info, with: BluetoothFactory())
    }
}
