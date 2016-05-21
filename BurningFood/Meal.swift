//
//  Food.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 11/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var category: String = ""
    var name: String = ""
    var photoURL: String = ""
    var searchString: String = ""
    
    init(searchString: String, category: String, name: String, photoURL: String){
        self.category = category
        self.name = name
        self.photoURL = photoURL
        self.searchString = searchString
    }
    
    init (){
    }
    
}