//
//  CategoryService.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 22/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class CategoryService {
    
    let category1 = Category(categoryName: "American", searchString: "american", photoURL: "flag_america")
    let category2 = Category(categoryName: "Chinese", searchString: "chinese", photoURL: "flag_italy")
    let category3 = Category(categoryName: "Cuban", searchString: "cuban", photoURL: "flag_cuba")
    let category4 = Category(categoryName: "Danish", searchString: "danish", photoURL: "flag_denmark")
    let category5 = Category(categoryName: "French", searchString: "french", photoURL: "flag_france")
    let category6 = Category(categoryName: "German", searchString: "german", photoURL: "flag_germany")
    let category7 = Category(categoryName: "Greek", searchString: "greek", photoURL: "flag_grecee")
    let category8 = Category(categoryName: "Italian", searchString: "italian", photoURL: "flag_italy")
    let category9 = Category(categoryName: "Japanese", searchString: "japanese", photoURL: "flag_japan")
    let category10 = Category(categoryName: "Mexican", searchString: "mexican", photoURL: "flag_mexico")
    let category11 = Category(categoryName: "Thai", searchString: "thai", photoURL: "flag_thailand")
    let category12 = Category(categoryName: "British", searchString: "british", photoURL: "flag_unitedkingdom")
    let category13 = Category(categoryName: "Vietnamese", searchString: "vietnamese", photoURL: "flag_vietnam")
    
    

    
    var categories: [Category] = []
    
    func getCategories() -> [Category] {
        
        categories.append(category1)
        categories.append(category2)
        categories.append(category3)
        categories.append(category4)
        categories.append(category5)
        categories.append(category6)
        categories.append(category7)
        categories.append(category8)
        categories.append(category9)
        categories.append(category10)
        categories.append(category11)
        categories.append(category12)
        categories.append(category13)
        
        return categories
    }
    
}