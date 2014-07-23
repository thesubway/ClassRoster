//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/22/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    
    @IBOutlet var twitterField: UITextField!
    @IBOutlet var githubField: UITextField!
    
    let textFieldPadding = 100
    
    var currentPerson:Person?
    override func viewDidLoad() {
        //add the image:
        personImage.image = UIImage(named:"programmerPerson.jpeg")
        personImage.layer.borderWidth = 1
        personImage.layer.borderColor = UIColor.greenColor().CGColor
        //cornerRadius makes the corner-lines round.
        personImage.layer.cornerRadius = 20
        //personImage.startAnimating()
        if let newPerson = currentPerson {
            firstNameField.text = newPerson.firstName
            lastNameField.text = newPerson.lastName
            twitterField.text = newPerson.twitterHandle
            githubField.text = newPerson.githubHandle
        }
        else {
            firstNameField.text = "Can't"
            lastNameField.text = ""
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        if let newPerson = currentPerson {
            newPerson.firstName = firstNameField.text
            newPerson.lastName = lastNameField.text
            newPerson.twitterHandle = twitterField.text
            newPerson.githubHandle = githubField.text
        }
    }
    
    //Note: this only works once I include inherit of UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField!) {
        println("does begin editing.")
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
        let newY = 0 + textField.frame.origin.y - self.textFieldPadding
        let currentX = self.view.bounds.origin.x
        //without animation, this will immediately translate. with animation, it's smooth.
        UIView.animateWithDuration(0.3) {
            self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, -120.0)
        }
    }
    func textFieldDidEndEditing(textField: UITextField!) {
        println("STOP editing")
        //let currentWidth = self.view.bounds.width
        //let currentHeight = self.view.bounds.height
        
        //earlier it was -120.0 (negative y goes up), but when ending, it becomes 120.0:
        UIView.animateWithDuration(0.3) {
            self.view.transform = CGAffineTransformTranslate(self.view.transform, 0.0, 120.0)
        }
    }
    
    //so that hitting enter makes it disappear.
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
        
    }
}
