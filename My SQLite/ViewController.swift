//
//  ViewController.swift
//  My SQLite
//
//  Created by Muhammed Essa on 1/20/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    var persons:[Person] = []
    var personId = 0
    var db:DBHelper = DBHelper()
    
    @IBOutlet var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return persons.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Name: " + persons[indexPath.row].name + " - age: " +  String( persons[indexPath.row].age )
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            db.deleteByID(id: persons[indexPath.row].id)
            persons = db.read()
            table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personId = persons[indexPath.row].id
        performSegue(withIdentifier: "toEdit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit" {
            let editViewController = segue.destination as! EditViewController
            editViewController.personId = personId
        }
    }
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
            persons = db.read()
            self.table.reloadData()
    }


}

