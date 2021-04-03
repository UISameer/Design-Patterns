import XCTest
@testable import DesignPatterns


class BuilderPattern: XCTestCase {

    func testBuilderPattern() throws {
        //// Usage
        let steak = Dish(name: "Steak", price: 2.30)
        let chips = Dish(name: "Chips", price: 1.20)
        let coffee = Dish(name: "Coffee", price: 0.80)
        
        let builder = OrderBuilder()
        builder.reset()
        builder.setMainCourse(steak)
        builder.setGarnish(chips)
        builder.setDrink(coffee)
        
        let order = builder.getResult()
        order?.price
        
        // Result:
        // 4.30

    }
}
