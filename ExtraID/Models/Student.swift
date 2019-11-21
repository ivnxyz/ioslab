//
//  Student.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation

class Student {
    
    // Atributos
    let name: String
    let accountNumber: String
    let photoUrl: String
    
    init(name: String, accountNumber: String, photoUrl: String) {
        self.name = name
        self.accountNumber = accountNumber
        self.photoUrl = photoUrl
    }
    
    convenience init?(studentData: [String: Any]) {
        guard
            let name = studentData["nombre"] as? String,
            let accountNumber = studentData["cuenta"] as? String,
            let photoUrl = studentData["foto_url"] as? String
        else { return nil }
        
        self.init(name: name, accountNumber: accountNumber, photoUrl: photoUrl)
    }
    
}
