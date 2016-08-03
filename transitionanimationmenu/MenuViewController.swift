//
//  MenuViewController.swift
//  TransitionAnimationMenu
//
//  Created by Victor Hong on 7/14/16.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var textPostIcon: UIImageView!
    @IBOutlet var photoPostIcon: UIImageView!
    @IBOutlet var quotePostIcon: UIImageView!
    @IBOutlet var linkPostIcon: UIImageView!
    @IBOutlet var chatPostIcon: UIImageView!
    @IBOutlet var audioPostIcon: UIImageView!
    
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.transitioningDelegate = self.transitionManager
        
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
