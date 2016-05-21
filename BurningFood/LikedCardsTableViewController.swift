//
//  LikedCardsTableViewController.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 20/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class LikedCardsTableViewController: UITableViewController {

    let coreDataService = CoreDataService()
    
    var likedmeals = [LikedMeal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likedmeals = coreDataService.loadLikedMeals()
        
        // observer that get called from webViewController when tab is favored. calls func refresh list
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LikedCardsTableViewController.refreshList(_:)), name:"refreshMyTableView", object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return likedmeals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCells", forIndexPath: indexPath) as! LikedCardsTableViewCell

        let imgUrl = self.likedmeals[indexPath.row].url

        cell.imgView_meal.image = UIImage(named: imgUrl!)
        cell.imgView_meal.contentMode = .ScaleAspectFill // fills the imageview
        cell.imgView_meal.clipsToBounds = true // clips to all sides of imageview
        cell.imgView_meal.layer.cornerRadius = 3.0 // round corners
        
        cell.lbl_category.text = self.likedmeals[indexPath.row].category
        cell.lbl_mealName.text = self.likedmeals[indexPath.row].name

        return cell
    }
    
    func refreshList(notification: NSNotification){
        likedmeals = coreDataService.loadLikedMeals()
        self.tableView.reloadData()
        
        if likedmeals.count != 0 {
            (tabBarController!.tabBar.items![1] ).badgeValue = "\(likedmeals.count)"
        }
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            coreDataService.deleteSongCoreData(likedmeals[indexPath.row])
            
            likedmeals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            if likedmeals.count != 0 {
                (tabBarController!.tabBar.items![1] ).badgeValue = "\(likedmeals.count)"
            } else {
                (tabBarController!.tabBar.items![1] ).badgeValue = nil
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segueToMapView") {
            let segueToMapView = segue.destinationViewController as? MapViewController
            
            print(likedmeals[(tableView.indexPathForSelectedRow?.row)!])
            
            segueToMapView?.likedMeal = (likedmeals[(tableView.indexPathForSelectedRow?.row)!]).searchString!
        }
    }



}
