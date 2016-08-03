//
//  ViewController.swift
//  Week5Picture
//
//  Created by Victor Hong on 7/18/16.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UpdateProtocol {

    var name = [:]
    var detailDescription = "I am trying to change my career into software development, mainly focusing on iOS development.  At the moment I am trying figure out what skills/knowledge I should learn to improve myself and help my chance into becoming a software developer."
    var imageName = "Victor"
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name = ["firstName": "Victor", "lastName": "Hong"]
        imageView.image = UIImage(named: imageName)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        detailTextView.text = detailDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDetails(detail: String) {
        detailDescription = detail
    }

    @IBAction func learnMoreButton(sender: AnyObject) {
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.name = self.name
        detailVC.detailDescription = self.detailDescription
        detailVC.imageName = self.imageName
        detailVC.updateDelegate = self
    }
}

