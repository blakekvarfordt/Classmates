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
    
    var groups = [[Person]]()
    
    var people = [Person]()
    
    func createPerson(name: String) {
        let person = Person(name: name)
        people.append(person)
        saveData()
    }
    
    func deletePerson(person: Person) {
        guard let personIndex = people.firstIndex(of: person) else { return }
        people.remove(at: personIndex)
        saveData()
    }
    
    func fileURl() -> URL{
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let createdFile = urls[0].appendingPathComponent("noteData.json")
        return createdFile
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(people)
            
            try data.write(to: fileURl())
        } catch let error {
            print(error)
        }
    }
    
    func loadData() {
        let decoder = JSONDecoder()
        do {
            let decodedData = try Data(contentsOf: fileURl())
            let persons = try decoder.decode([Person].self, from: decodedData)
            people = persons
        }catch let error {
            print(error)
        }
    }
}
