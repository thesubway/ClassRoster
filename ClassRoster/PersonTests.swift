//
//  PersonTests.swift
//  ClassRoster
//
//  Created by Daniel Hoang on 7/21/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import XCTest


class PersonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPersonCreation() {
        var person = Person(firstName: "Russell", lastName: "Wilson")
        //XCT has assertion functions.
        XCTAssertNotNil(person, "Test fails. person can not be created")
    }
    
    func testFirstName() {
        var person = Person(firstName: "Richard", lastName: "Sherman")
        person.firstName = "Brad"
        XCTAssertNotNil(person.firstName, "person's first name property could not be created")
    }
    
    func testPersonInit() {
        var person = Person(firstName:"Brad",lastName:"Johnson")
        XCTAssertNotNil(person, "person can not be created")
    }
    
    func testFullName() {
        var first = "Doug"
        var last = "Badlwin"
        var person = Person(firstName: first, lastName: last)
        
        XCTAssertEqual(person.fullName(),first + last, "full name is matching")
    }
}
