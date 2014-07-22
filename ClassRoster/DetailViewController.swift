//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/22/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var personImage: UIImageView
    @IBOutlet var firstNameField: UITextField
    @IBOutlet var lastNameField: UITextField
    var currentPerson:Person?
    override func viewDidLoad() {
        //add the image:
        personImage.image = UIImage(named:"programmerPerson.jpeg")
        //personImage.startAnimating()
        if let newPerson = currentPerson {
            firstNameField.text = newPerson.firstName
            lastNameField.text = newPerson.lastName
        }
        else {
            firstNameField.text = "Can't"
            lastNameField.text = ""
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(sender: AnyObject) {
        if let newPerson = currentPerson {
            newPerson.firstName = firstNameField.text
            newPerson.lastName = lastNameField.text
        }
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
