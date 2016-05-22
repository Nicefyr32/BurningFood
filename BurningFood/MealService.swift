//
//  MealService.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 11/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class MealService {
    
    let meal1 = Meal(searchString: "pizza", category: "Italian", name: "Pizza", photoURL: "pizza")
    let meal2 = Meal(searchString: "burger", category: "American", name: "Burger", photoURL: "burger")
    let meal3 = Meal(searchString: "pizza", category: "Italian", name: "Lasange", photoURL: "lasange")
    let meal4 = Meal(searchString: "pizza", category: "American", name: "Fries", photoURL: "fries")
    let meal5 = Meal(searchString: "cafe", category: "Salat", name: "Salat", photoURL: "salat")
    let meal6 = Meal(searchString: "mexican", category: "Mexican", name: "Taco", photoURL: "taco")
    let meal7 = Meal(searchString: "cake", category: "Dessert", name: "Cake", photoURL: "cake")
    let meal8 = Meal(searchString: "hotdog", category: "Street food", name: "Hotdog", photoURL: "hotdog")

    
    var meals: [Meal] = []
    
    func getMeals() -> [Meal] {
        
        meals.append(meal1)
        meals.append(meal2)
        meals.append(meal3)
        meals.append(meal4)
        meals.append(meal5)
        meals.append(meal6)
        meals.append(meal7)
        meals.append(meal8)
        
        return meals
    }
    
}