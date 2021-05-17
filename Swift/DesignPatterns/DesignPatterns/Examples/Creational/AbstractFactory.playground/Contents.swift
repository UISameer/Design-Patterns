// The abstract factory pattern is used to provide a client with a set of related or dependant objects.
// The "family" of objects created by the factory are determined at run-time.

// MARK: - Protocols
protocol BurgerDescribing {
    var ingredients: [String] { get }
}

struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

protocol BurgerMaking {
    func make() -> BurgerDescribing
}

final class McDonaldsBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "Tomato"])
    }
}

final class BurgerKingBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Tomato", "Onions"])
    }
}

// MARK: - Abstract Factory
enum BurgerFactoryType: BurgerMaking {
    
    case McDonalds
    case BurgerKing
    
    func make() -> BurgerDescribing {
        switch self {
        case .McDonalds:
            return McDonaldsBurger().make()
        case .BurgerKing:
            return BurgerKingBurger().make()
        }
    }
}

// MARK: - Usage
let bigKahuna = BurgerFactoryType.McDonalds.make()
let jackInTheBox = BurgerFactoryType.BurgerKing.make()
