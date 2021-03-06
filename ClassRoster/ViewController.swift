//
//  ViewController.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/21/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var people = [Person]() //lazy means it does not get instantiated yet.
    @IBOutlet var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.people = self.createList()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createList() -> [Person] {
        var personList = [Person]()
        var getPath = NSBundle.mainBundle().pathForResource("PeopleList", ofType: "plist")
        var peopleArray = NSArray(contentsOfFile: getPath)
        for eachPersonDict in peopleArray {
            //if let person = eachPersonDict as? Dictionary<String, String>
            //the as, ensures that it is a dictionary.
            var firstN = eachPersonDict["firstName"] as String
            var lastN = eachPersonDict["lastName"] as String
            //var completeName = "\(firstN) \(lastN)"
            var newPerson = Person(firstName: "\(firstN)", lastName: "\(lastN)")
            personList.append(newPerson)
            //scaledToSize:(CGSize)newSize
        }
        
        return personList
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var newView = segue.destinationViewController as DetailViewController
        
        if segue.identifier == "showPerson" {
            newView.currentPerson = people[self.tableView!.indexPathForSelectedRow().row]
        }
    }
    
    /*func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    } */
    
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        println(people.count)
        return people.count //how many
    }
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
        //we want to grab a reference for
        let personForRow = people[indexPath.row]
        //cell.textLabel.text = personForRow.firstName
        //cell.detailTextLabel.text = personForRow.lastName
        cell.firstNameLabel.text = personForRow.firstName
        cell.lastNameLabel.text = personForRow.lastName
        cell.lastNameLabel.font = UIFont(name: cell.lastNameLabel.font.fontName, size: 12)
        
        //println(personForRow.firstName + personForRow.lastName)
        //cell.imageView.contentMode = UIViewContentMode.ScaleToFill
        //cell.imageView.contentMode = UIViewContentMode.Redraw
        if let uniqueImage = personForRow.personsImage {
            // show the image
            cell.imageInCell.image = uniqueImage
//            print(cell.imageView.image.size.width)
//            print(" Is width. Height: ")
//            println(cell.imageView.image.size.height)
        } else {
            // hide the image view
            //set default image
            
            cell.imageInCell.image = UIImage(named:"programmerPerson.jpeg")
            //cell.frame.width
        }

        //cell.imageView.image.imageOrientation =
        //cell.imageView.image.size.
        
        return cell
    }
    //make the segue by code:
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println(indexPath.row)
        
        let detailViewControl = self.storyboard.instantiateViewControllerWithIdentifier("detailViewControl") as DetailViewController
        
        detailViewControl.currentPerson = self.people[indexPath.row]
        
        if self.navigationController {
            self.navigationController.pushViewController(detailViewControl, animated: true)
        }
    }
}
