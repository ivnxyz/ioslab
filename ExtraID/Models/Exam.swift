//
//  Exam.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation

class Exam {
    
    // Atributos
    let name: String
    let studentsIds: [String]
    
    // Init
    init(name: String, studentsIds: [String]) {
        self.name = name
        self.studentsIds = studentsIds
    }
    
    convenience init?(examData: [String: Any]) {
        guard
            let name = examData["nombre"] as? String,
            let studentsIds = examData["estudiantes"] as? [String]
        else { return nil }
        
        self.init(name: name, studentsIds: studentsIds)
    }
    
}
