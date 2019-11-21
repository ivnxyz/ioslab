//
//  TeachersClient.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation
import FirebaseFirestore

class TeachersClient {
    
    // Atributos
    
    let teachersCollection: CollectionReference
    
    // Inicializar la clase
    
    init() {
        // Inicializar base de datos
        let db = Firestore.firestore()
        
        // Inicializar referencia a los maestros
        teachersCollection = db.collection("profesores")
    }
    
    // Obtener el perfil de un profesor con su id
    func getTeacherProfile(teacherId: String, completionHandler: @escaping (Error?, Teacher?) -> Void) {
        teachersCollection.document(teacherId).getDocument { (snapshot, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let snapshot = snapshot {
                if let data = snapshot.data() {
                    // Inicializar profesor
                    let teacher = Teacher(teacherData: data)
                    
                    if let teacher = teacher {
                        completionHandler(nil, teacher)
                    } else {
                        // Datos inválidos
                        completionHandler(TeacherError.invalidData, nil)
                    }
                } else {
                    // No hay objeto data
                    completionHandler(TeacherError.noDataObject, nil)
                }
            }
        }
    }
}

enum TeacherError: Error {
    case invalidData
    case noDataObject
}

extension TeacherError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Los datos del maestro no son válidos", comment: "")
        case .noDataObject:
            return NSLocalizedString("No se encontró el objeto data", comment: "")
        }
    }
}
