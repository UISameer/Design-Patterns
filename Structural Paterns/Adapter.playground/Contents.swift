import Foundation

// Adaptee
class Meter {
    
    func getLength() -> Double {
        let meter = Double.random(in: 1.5...3.0)
        print("Length in meter is: \(meter)")
        return meter
    }
}

// Target
protocol Feet {
    func getLength() -> Double
}

// Adapter
class MeterToFeetAdapter: Feet {
    
    private let meter: Meter
    
    init(meter: Meter) {
        self.meter = meter
    }
    
    func getLength() -> Double {
        let meter = meter.getLength()
        let centimeter = Double(round(meter * 3.28084))
        print("Length in feet is: \(centimeter)")
        return centimeter
    }
}

// Client
class LengthCalculator {
    private let feet: Feet
    
    init(feet: Feet) {
        self.feet = feet
    }
    
    func displayLength() {
        let length = feet.getLength()
        print("Length is \(length) ft.")
    }
}

let meter = Meter()
let adapter = MeterToFeetAdapter(meter: meter)
let calculator = LengthCalculator(feet: adapter)
calculator.displayLength()


