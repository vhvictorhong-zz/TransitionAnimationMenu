//
//  TransitionManager.swift
//  TransitionsAnimation
//
//  Created by Victor Hong on 7/11/16.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

// Need two protocol to create animator object require 4 protocol methods
// ------
// Meets requirements of an animator
// animateTransition
// transitionDuration
// -----
// Meet transition delegate
// animationControllerForPresentedController
// animationControllerForDismissedController

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private var presenting = true
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods

    // animate a change from one viewcontroller to another
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: Perform animation
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        
        // setup 2D transitions for animations
        // let offstageLeft = CGAffineTransformMakeTranslation(-200, 0)
        // let offstageRight = CGAffineTransformMakeTranslation(200, 0)
        
        // create a tuple of our screens
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        // assign references to our menu view controller and the 'bottom' view controller from the tuple
        // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        // prepare the menu
        if (self.presenting){
            //prepare menu to fade in
            /*menuView.alpha = 0
            
            // prepare menu items to slide in
            menuViewController.textPostIcon.transform = offstageLeft
            
            menuViewController.photoPostIcon.transform = offstageRight*/
            offStageMenuController(menuViewController)
            
        }
        
        // add the both views to our view controller
        container!.addSubview(bottomView)
        container!.addSubview(menuView)
        
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.TransitionNone, animations: {
            
            // either fade in or fade out
            //menuView.alpha = self.presenting ? 1 : 0
            
            if (self.presenting) {
                // fade in
                /*menuView.alpha = 1
                
                // onstage items: slide in
                menuViewController.textPostIcon.transform = CGAffineTransformIdentity
                
                menuViewController.photoPostIcon.transform = CGAffineTransformIdentity*/
                self.onStageMenuController(menuViewController)
                
            } else {
                // fade out
                /*menuView.alpha = 0
                
                // offstage items: slide out
                menuViewController.textPostIcon.transform = offstageLeft
                
                menuViewController.photoPostIcon.transform = offstageRight*/
                self.offStageMenuController(menuViewController)
            }
            
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
                // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                
        })
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    //MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // remmeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // these methods are the perfect place to set our `presenting` flag to either true or false - voila!
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
    
    func offStageMenuController(menuViewController: MenuViewController) {
        
        // fade out
        menuViewController.view.alpha = 0
        
        //let offstageLeft = CGAffineTransformMakeTranslation(-200, 0)
        //let offstageRight = CGAffineTransformMakeTranslation(200, 0)
        
        // setup parameters for 2D transitions for animations
        let topRowOffset: CGFloat = 50
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 300
        
        menuViewController.textPostIcon.transform = self.offStage(-topRowOffset)
        menuViewController.photoPostIcon.transform = self.offStage(topRowOffset)
        menuViewController.quotePostIcon.transform = self.offStage(-middleRowOffset)
        menuViewController.linkPostIcon.transform = self.offStage(middleRowOffset)
        menuViewController.chatPostIcon.transform = self.offStage(-bottomRowOffset)
        menuViewController.audioPostIcon.transform = self.offStage(bottomRowOffset)
        
    }
    
    func onStageMenuController(menuViewController: MenuViewController) {
        
        // fade in
        menuViewController.view.alpha = 1
        
        menuViewController.textPostIcon.transform = CGAffineTransformIdentity
        menuViewController.photoPostIcon.transform = CGAffineTransformIdentity
        menuViewController.quotePostIcon.transform = CGAffineTransformIdentity
        menuViewController.linkPostIcon.transform = CGAffineTransformIdentity
        menuViewController.chatPostIcon.transform = CGAffineTransformIdentity
        menuViewController.audioPostIcon.transform = CGAffineTransformIdentity
        
    }
    
    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
}
