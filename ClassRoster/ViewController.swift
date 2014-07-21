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
        personList.append(Person(firstName: "Victor", lastName: "Adu"))
        personList.append(Person(firstName: "Collin", lastName: "Atherton"))
        personList.append(Person(firstName: "John", lastName: "Clem"))
        personList.append(Person(firstName: "Jeff", lastName: "Gayle"))
        personList.append(Person(firstName: "Daniel", lastName: "Hoang"))
        personList.append(Person(firstName: "Brad", lastName: "Johnson"))
        personList.append(Person(firstName: "Leonardo", lastName: "Lee"))
        personList.append(Person(firstName: "Alex", lastName: "Rice"))
        personList.append(Person(firstName: "Kirby", lastName: "Shabaga"))
        personList.append(Person(firstName: "Michael", lastName: "Tirenin"))
        personList.append(Person(firstName: "Collin", lastName: "Atherton"))
        
        return personList
    }

}
