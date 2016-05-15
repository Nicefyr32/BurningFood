//
//  MealService.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 11/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class MealService {
    
    let meal1 = Meal(category: "Italian", name: "Pizza", photoURL: "pizza")
    let meal2 = Meal(category: "American", name: "Burger", photoURL: "burger")
    
    var meals: [Meal] = []
    
    func getMeals() -> [Meal] {
        
        meals.append(meal1)
        meals.append(meal2)
        
        return meals
    }
    
}