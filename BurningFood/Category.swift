//
//  Category.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 22/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation

class Category {
    var categoryName: String = ""
    var searchString: String = ""
    var photoURL: String = ""
    
    init(categoryName: String, searchString: String, photoURL: String){
        self.categoryName = categoryName
        self.searchString = searchString
        self.photoURL = photoURL
    }
    
    init (){
    }
    
}