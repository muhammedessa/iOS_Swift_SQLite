//
//  EditViewController.swift
//  My SQLite
//
//  Created by Muhammed Essa on 1/20/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    
    var person:[Person] = []
    var personId = 0
    var db:DBHelper = DBHelper()
    
    
    @IBOutlet var nameEdit: UITextField!
    @IBOutlet var ageEdit: UITextField!
    
    @IBAction func updateBTN(_ sender: Any) {
        if nameEdit.text!.isEmpty{
                 let alertController = UIAlertController( title: "Need info", message: "All fields are reqiured", preferredStyle: .alert)
                 alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
                 self.present(alertController,animated: true,completion: nil)
                 return
             }
        
         let age = Int(ageEdit.text!)
        db.update(id: personId, name: nameEdit.text! , age: age! )
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         person = db.readOnlyOne(id: (personId))
        nameEdit.text = person[0].name
        ageEdit.text = String(person[0].age) 
//        print("-------------------------------------")
//         print("-------------------------------------")
//        print(personId)
//        print("-------------------------------------")
//          print("-------------------------------------")
//        print(person[0].name + " - "+String(person[0].age)  )
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
