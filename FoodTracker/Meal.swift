//
//  Meal.swift
//  FoodTracker
//
//  Created by Bruno Mayer Paixao on 12/7/16.
//  Copyright © 2016 Bruno Mayer Paixão. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
