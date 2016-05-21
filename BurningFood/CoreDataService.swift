//
//  CoreDataService.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 20/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var likedMeals : [LikedMeal] = []
    
    func saveMeal(meal: Meal) {
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("LikedMeal", inManagedObjectContext:managedContext)
        
        let favoritTab = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        favoritTab.setValue(meal.name, forKey: "name")
        favoritTab.setValue(meal.category, forKey: "category")
        favoritTab.setValue(meal.photoURL, forKey: "url")
        favoritTab.setValue(meal.searchString, forKey: "searchString")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func loadLikedMeals() -> [LikedMeal] {
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LikedMeal")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            likedMeals = results as! [LikedMeal]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return likedMeals
    }
    
    func deleteSongCoreData(meal: LikedMeal) {
        
        let managedContext = appDelegate.managedObjectContext
        
        managedContext.deleteObject(meal)
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("bug in saving \(error)")
        }
        
    }
    
    func getLikedNumber() -> Int {
        
        let managedContext = appDelegate.managedObjectContext
        
        let countRequest = NSFetchRequest(entityName: "LikedMeal")
        
        return managedContext.countForFetchRequest(countRequest, error: nil)
        
    }
    
}