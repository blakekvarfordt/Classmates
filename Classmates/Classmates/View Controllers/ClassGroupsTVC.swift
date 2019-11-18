//
//  ClassGroupsTVC.swift
//  Classmates
//
//  Created by Blake kvarfordt on 11/8/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class ClassGroupsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PersonController.shared.loadData()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addPersonAlert()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return PersonController.shared.groups.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = PersonController.shared.people[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // MARK: - Custom Methods
    
    func addPersonAlert() {
        let alertController = UIAlertController(title: "Add Person", message: "Type in a person's name to add to the class", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Type name here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add Person", style: .default) { (_) in
            guard let name = alertController.textFields?.first?.text else { return }
            PersonController.shared.createPerson(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
}
