//
//  SubjectsClient.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation
import FirebaseFirestore

class SubjectsClient {
    
    // Atributos
    
    let subjectsCollection: CollectionReference
    
    // Inicializar la clase
    
    init() {
        // Inicializar base de datos
        let db = Firestore.firestore()
        
        // Inicializar referencia a los maestros
        subjectsCollection = db.collection("materias")
    }
    
    // Obtener las materias del profesor
    func getSubject(subjectId: String, completionHandler: @escaping (Error?, Subject?) -> Void) {
        subjectsCollection.document(subjectId).getDocument { (snapshot, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let snapshot = snapshot {
                // Obtener los datos
                if let data = snapshot.data() {
                    // Inicializar materia
                    if let subject = Subject(subjectData: data) {
                        completionHandler(nil, subject)
                    } else {
                        completionHandler(SubjectsError.invalidData, nil)
                    }
                } else {
                    completionHandler(SubjectsError.noDataObject, nil)
                }
            }
        }
    }
    
}

enum SubjectsError: Error {
    case invalidData
    case noDataObject
}

extension SubjectsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Los datos del maestro no son válidos", comment: "")
        case .noDataObject:
            return NSLocalizedString("No se encontró el objeto data", comment: "")
        }
    }
}
