//
//  PersonController.swift
//  Classmates
//
//  Created by Blake kvarfordt on 11/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    
    var people = [Person]()
    
    func createPerson(name: String) {
        let person = Person(name: name)
        people.append(person)
    }
}
