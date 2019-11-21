//
//  Subject.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation

class Subject {
    
    // Atributos
    let name: String
    let classroom: String
    let schedule: String
    let key: String
    let studentsIds: [String]
    
    init(name: String, classroom: String, schedule: String, key: String, studentsIds: [String]) {
        self.name = name
        self.classroom = classroom
        self.schedule = schedule
        self.key = key
        self.studentsIds = studentsIds
    }
    
    // Inicializar con un diccionario
    convenience init?(subjectData: [String: Any]) {
        guard
            let name = subjectData["nombre"] as? String,
            let classroom = subjectData["salon"] as? String,
            let schedule = subjectData["horario"] as? String,
            let key = subjectData["llave"] as? String,
            let studentsIds = subjectData["alumnos"] as? [String]
        else { return nil }
        
        self.init(name: name, classroom: classroom, schedule: schedule, key: key, studentsIds: studentsIds)
    }
    
}
