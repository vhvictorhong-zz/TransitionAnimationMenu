//
//  DetailViewController.swift
//  Week5Picture
//
//  Created by Victor Hong on 7/18/16.
//  Copyright © 2016 Victor Hong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    var name = [:]
    var detailDescription = ""
    var imageName = ""
    var updateDelegate: UpdateProtocol?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let firstName = name["firstName"], lastName = name["lastName"] {
            nameLabel.text = "\(firstName) \(lastName)"
        }
        detailTextView.text = detailDescription
        imageView.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(sender: AnyObject) {
        //print(detailTextView.text)
        if let updateDelegate = self.updateDelegate {
            updateDelegate.updateDetails(detailTextView.text)
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        return true
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
