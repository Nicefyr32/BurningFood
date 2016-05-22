//
//  TabBarViewController.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 21/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Sets the default color of the icon of the selected UITabBarItem and Title
        
        UITabBar.appearance().tintColor = UIColor(red: 237.0/255.0, green: 67.0/255.0, blue: 55.0/255.0, alpha: 1)
        
        for item in self.tabBar.items! as [UITabBarItem]
        {
            //item.image = item.selectedImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Selected)
            item.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Futura", size: 10.0)!], forState: UIControlState.Normal)
            item.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Futura", size: 10.0)!], forState: UIControlState.Disabled)

        }
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
