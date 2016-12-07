//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Bruno Mayer Paixão on 8/13/16.
//  Copyright © 2016 Bruno Mayer Paixão. All rights reserved.
//

import XCTest
import UIKit

class FoodTrackerTests: XCTestCase {
    // MARK: FoodTracker Tests
    
    func testMealInitialization() {
        // success case
        let potentialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Realyh bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid")
    }
}
