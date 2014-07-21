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
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
}