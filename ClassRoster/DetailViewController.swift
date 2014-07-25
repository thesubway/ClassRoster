//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/22/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import MobileCoreServices

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var twitterField: UITextField!
    @IBOutlet var githubField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    
    let imgPicker = UIImagePickerController()
    
    let textFieldPadding = 100
    
    var currentPerson:Person!
    override func viewDidLoad() {
        //add the image:
        if let thisImage = currentPerson.personsImage {
            //so if they already have an image, that image displays.
            personImage.image = thisImage
        }
        else {
            personImage.image = UIImage(named:"programmerPerson.jpeg")
        }
        //attempt to scale it.
        personImage.contentMode = UIViewContentMode.ScaleAspectFill
        personImage.layer.borderWidth = 1
        personImage.layer.borderColor = UIColor.greenColor().CGColor
        //cornerRadius makes the corner-lines round.
        personImage.layer.cornerRadius = 20
        personImage.layer.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        personImage.contentMode = UIViewContentMode.ScaleAspectFill
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
        //create different feature for phone.
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            
        } else if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("saveClicked:"))
            self.navigationItem.rightBarButtonItem = saveButton
            self.saveButton?.removeFromSuperview()
        }
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
    
    @IBAction func choosePicPressed(sender: AnyObject) {
        println("choosePicPressed")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            println("Button capture")
            
            var imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.Camera;
            //imag.mediaTypes = [kUTTypeImage]
            imag.allowsEditing = false
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        println("snapped the pic yo!!!")
        picker.dismissViewControllerAnimated(true) {
            self.personImage.image = info[UIImagePickerControllerOriginalImage] as UIImage
            if let aPerson = self.currentPerson {
                aPerson.personsImage = self.personImage.image
                //aPerson.personsImage.contentMode = UIViewContentMode.ScaleAspectFill
            }
            println("now navigate next")
        }
        
    }
}
