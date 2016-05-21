//
//  LikedMeal+CoreDataProperties.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 20/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LikedMeal {

    @NSManaged var name: String?
    @NSManaged var url: String?
    @NSManaged var category: String?
    @NSManaged var searchString: String?

}
