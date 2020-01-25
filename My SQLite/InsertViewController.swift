//
//  InsertViewController.swift
//  My SQLite
//
//  Created by Muhammed Essa on 1/20/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {
    
    var persons:[Person] = []
    var db:DBHelper = DBHelper()

    @IBOutlet var nameEditText: UITextField!
    @IBOutlet var ageEditText: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        if nameEditText.text!.isEmpty{
                 let alertController = UIAlertController( title: "Need info", message: "All fields are reqiured", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
                 self.present(alertController,animated: true,completion: nil)
                 return
             }
             
             if ageEditText.text!.isEmpty{
                 let alertController = UIAlertController( title: "Need info", message: "All fields are reqiured", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
                 self.present(alertController,animated: true,completion: nil)
                 return
             }
             let age = ageEditText.text!
             db.insert(name: nameEditText.text!, age: Int(age) ?? 0 )
             
             
    }
    
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
     

}
