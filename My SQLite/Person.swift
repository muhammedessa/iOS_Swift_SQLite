//
//  Person.swift
//  My SQLite
//
//  Created by Muhammed Essa on 1/20/20.
//  Copyright © 2020 Muhammed Essa. All rights reserved.
//

import Foundation

class Person {
    
    var name : String = ""
    var age: Int = 0
    var id: Int = 0
    
    init(id:Int , name:String , age:Int) {
        self.name = name
        self.age = age
        self.id = id
    }
    
    
}
