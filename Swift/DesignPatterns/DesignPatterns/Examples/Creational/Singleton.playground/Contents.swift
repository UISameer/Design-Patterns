import UIKit

/*
 The singleton pattern ensures that only one object of a particular class is ever created. All further references to objects of the singleton class refer to the same underlying instance. There are very few applications, do not overuse this pattern!
 */

final class Tesla {
    static let shared = Tesla()
    
    private init() {
        // Private initialization to ensure just one instance is created.
    }
}

let elon = Tesla.shared // There is only one Elon Musk folks.
