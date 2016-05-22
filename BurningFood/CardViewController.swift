//
//  ViewController.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 11/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class CardViewController: UIViewController {
    
    var mealService = MealService()
    var coreDataService = CoreDataService()
    
    var meals: [Meal] = []
    var meal = Meal()
    
    var cardViews: [CardView] = []
    var currentCardView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add a gradient effect
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = self.view.bounds
//        gradient.colors = [UIColor(red:0.95, green:0.56, blue:0.30, alpha:1.0).CGColor, UIColor(red:0.95, green:0.56, blue:0.30, alpha:1.0).CGColor]
//        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        updateLikedBadge()
        
        
        // adds cards to the view
        addCards()
        
    }
    
    func updateLikedBadge(){
        
        let likedMealCount = coreDataService.getLikedNumber()
        
        if likedMealCount != 0 {
            (tabBarController!.tabBar.items![1] ).badgeValue = "\(likedMealCount)"
        }
        
        (tabBarController!.tabBar.items![1]).image = UIImage(icon: FAType.FACutlery, size: CGSize(width: 35, height: 35))
        (tabBarController!.tabBar.items![2]).image = UIImage(icon: FAType.FABars, size: CGSize(width: 35, height: 35))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCards() {
        meals = mealService.getMeals()
        
        for meal in meals {
            currentCardView = CardView (frame: self.view.frame, meal: meal, bounds: self.view.bounds)
            self.cardViews.append(currentCardView)
        }
        
        for cardView in cardViews {
            self.view.addSubview(cardView)
            // Add Pan Gesture Recognizer
            let pan = UIPanGestureRecognizer(target: self, action: #selector(CardViewController.handlePanGesture(_:)))
            cardView.addGestureRecognizer(pan)
        }
    }
    
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        // Is this gesture state finished??
        if gesture.state == UIGestureRecognizerState.Ended {
            // Determine if we need to swipe off or return to center
            if currentCardView.center.x / self.view.bounds.maxX > 0.8 {
                self.meal = currentCardView.meal
                coreDataService.saveMeal(self.meal)
                determineJudgement(true)
                updateLikedBadge()
                NSNotificationCenter.defaultCenter().postNotificationName("refreshMyTableView", object: nil)
            }
            else if currentCardView.center.x / self.view.bounds.maxX < 0.2 {
                determineJudgement(false)
            }
            else {
                currentCardView.returnToCenter()
            }
        }
        let translation = gesture.translationInView(currentCardView)
        currentCardView.center = CGPoint(x: currentCardView!.center.x + translation.x, y: self.currentCardView!.center.y + translation.y)
        gesture.setTranslation(CGPointZero, inView: self.view)
    }
    
    
    func determineJudgement(answer: Bool) {
        
        // Run the swipe animation
        self.currentCardView.swipe(answer)
        
        // Handle when we have no more matches
        cardViews.removeAtIndex(cardViews.count - 1)
        if cardViews.count - 1 < 0 {
            return
        } else {
            // Set the new current question to the next one
            currentCardView = cardViews.last!
        }
        
    }
    

}

