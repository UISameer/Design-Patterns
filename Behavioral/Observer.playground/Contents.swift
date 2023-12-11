import Foundation

// Protocol for Observers
protocol Observer: AnyObject {
    func update()
}

// Protocol for subjects
protocol Subject {
    func addObservers(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notifyObservers()
}

// Concrete Subject
class BloodPressureMonitor: Subject {
    
    var bloodPressure: Int = 0
    private var observers = [Observer]()
    
    func addObservers(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers = observers.filter{ $0 !== observer }
    }
    
    func notifyObservers() {
        observers.forEach{ $0.update() }
    }
    
    func updateBloodPressure(newBloodPressure: Int) {
        bloodPressure = newBloodPressure
        // Notify Observers
        notifyObservers()
    }
}

// Concrete Observer
class Display: Observer {
    
    private let monitor: BloodPressureMonitor
    
    init(monitor: BloodPressureMonitor) {
        self.monitor = monitor
        // Add self as observer
        self.monitor.addObservers(self)
    }
    
    deinit {
        monitor.removeObserver(self)
    }
    
    func update() {
        debugPrint("BP is now \(monitor.bloodPressure).")
    }
}

let monitor = BloodPressureMonitor()
let display = Display(monitor: monitor)
monitor.updateBloodPressure(newBloodPressure: 120)
monitor.removeObserver(display)
