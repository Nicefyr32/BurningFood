//
//  CardView.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 11/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class CardView: UIView {
    let imageMarginSpace: CGFloat = 8.0
    var animator: UIDynamicAnimator!
    var originalCenter: CGPoint!
    var meal = Meal()

    init(frame: CGRect, meal: Meal, bounds: CGRect) {
        
        //
        self.meal = meal
        
        // Creates a cardFrame depending on the View send from view controller
        let cardFrame = CGRectMake(0, 0, frame.width - 50, frame.height - 250)
        
        // 
        let cardCenter = CGPoint(x: bounds.width / 2, y: bounds.height / 2.2)
        
        // Creates the card
        super.init(frame: cardFrame)
        self.center = cardCenter //center the card in the view
        
        // Holds the origial center location
        self.originalCenter = cardCenter
        
        // Set the background to white
        self.backgroundColor = UIColor.whiteColor()
        
        // For animating physics
        animator = UIDynamicAnimator(referenceView: self)
        
        // Card
        let cardView = UIView()
        
        // Makes an image
        let image = UIImage(named: meal.photoURL)
        // Set the image in an image view
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .ScaleAspectFill // fills the imageview
        imageView.clipsToBounds = true // clips to all sides of imageview
        imageView.layer.cornerRadius = 3.0 // round corners
        
        // Sets the size of the imageview inside the card
        imageView.frame = CGRectIntegral(CGRectMake(
                self.imageMarginSpace,
                self.imageMarginSpace,
                self.frame.width - (2 * self.imageMarginSpace),
                self.frame.height - (15 * self.imageMarginSpace)
            ))
        
        // adds image to the cardField
        cardView.addSubview(imageView)
        
        // Title label
        let lbl_titleLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        lbl_titleLabel.center = CGPointMake(115, 330)
        lbl_titleLabel.textAlignment = NSTextAlignment.Left
        lbl_titleLabel.text = "Meal:"
        lbl_titleLabel.font = UIFont(name: "Futura", size: 17.0)
        cardView.addSubview(lbl_titleLabel)
        
        let lbl_title = UILabel(frame: CGRectMake(0, 0, 200, 21))
        lbl_title.center = CGPointMake(205, 330)
        lbl_title.textAlignment = NSTextAlignment.Right
        lbl_title.text = meal.name
        lbl_title.font = UIFont(name: "Futura", size: 17.0)
        cardView.addSubview(lbl_title)

        // Category label
        let lbl_categoryLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        lbl_categoryLabel.center = CGPointMake(115, 360)
        lbl_categoryLabel.textAlignment = NSTextAlignment.Left
        lbl_categoryLabel.text = "Category:"
        lbl_categoryLabel.font = UIFont(name: "Futura", size: 17.0)
        cardView.addSubview(lbl_categoryLabel)
        
        let lbl_category = UILabel(frame: CGRectMake(0, 0, 200, 21))
        lbl_category.center = CGPointMake(205, 360)
        lbl_category.textAlignment = NSTextAlignment.Right
        lbl_category.text = meal.category
        lbl_category.font = UIFont(name: "Futura", size: 17.0)
        cardView.addSubview(lbl_category)
        
        self.addSubview(cardView)
        self.applyShadow()
        
    }
    
    func applyShadow() {
        self.layer.cornerRadius = 3.0
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 2, height: -3)
    }
    
    func swipe(answer: Bool) {
        animator.removeAllBehaviors()
        
        // If the answer is false, Move to the left
        // Else if the answer is true, move to the right
        let gravityX = answer ? 0.5 : -0.5
        let magnitude = answer ? 20.0 : -20.0
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items: [self])
        gravityBehavior.gravityDirection = CGVectorMake(CGFloat(gravityX), 0)
        animator.addBehavior(gravityBehavior)
        
        let pushBehavior:UIPushBehavior = UIPushBehavior(items: [self], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.magnitude = CGFloat(magnitude)
        animator.addBehavior(pushBehavior)
        
    }
    
    func returnToCenter() {
        UIView.animateWithDuration(0.8, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .AllowUserInteraction, animations: {
            self.center = self.originalCenter
            }, completion: { finished in
                print("Finished Animation")}
        )
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
