//
//  Person.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/21/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit


class Person {
    
    var firstName : String
    var lastName : String
    var middleName = "Edward"
    var image : UIImage?
    var twitterHandle: String?
    var githubHandle: String?
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
        //set these based on firstName and lastName
        self.twitterHandle = "#\(firstName+lastName)"
        self.githubHandle = "\(firstName+lastName)"
        
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
    
    /*func loadPeopleFromPList () -> Array<Person> {
        var people = Array<Person>()
        let plistPath = NSBundle.mainBundle().pathForResource("PeopleList", ofType: "plist")
        let peopleArray = NSArray(contentsOfFile: plistPath)
        
        for person in people
    } */
}