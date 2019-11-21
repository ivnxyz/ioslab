//
//  Teacher.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation

class Teacher {
    
    // Atributos
    let name: String
    let apellidoPaterno: String
    let apellidoMaterno: String
    let photoUrl: String
    let subjectsIds: [String]
    
    // Init
    init(name: String, apellidoPaterno: String, apellidoMaterno: String, photoUrl: String, subjectsIds: [String]) {
        self.name = name
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.photoUrl = photoUrl
        self.subjectsIds = subjectsIds
    }
    
    // Inicializar con un diccionario
    convenience init?(teacherData: [String: Any]) {
        guard
            let name = teacherData["nombre"] as? String,
            let apellidoPaterno = teacherData["apellido_paterno"] as? String,
            let apellidoMaterno = teacherData["apellido_materno"] as? String,
            let photoUrl = teacherData["foto_url"] as? String,
            let subjectsIds = teacherData["materias"] as? [String]
        else { return nil }
        
        self.init(name: name, apellidoPaterno: apellidoPaterno, apellidoMaterno: apellidoMaterno, photoUrl: photoUrl, subjectsIds: subjectsIds)
    }
    
}
