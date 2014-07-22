//
//  ViewController.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/21/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var people = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.people = self.createList()
        // Do any additional setup after loading the view, typically from a nib.
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
            var firstN = eachPersonDict["firstName"]
            var lastN = eachPersonDict["lastName"]
            //var completeName = "\(firstN) \(lastN)"
            var newPerson = Person(firstName: "\(firstN)", lastName: "\(lastN)")
            personList.append(newPerson)
        }
        
        return personList
    }

}
