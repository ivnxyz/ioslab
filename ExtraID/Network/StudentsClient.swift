//
//  StudentsClient.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation
import FirebaseFirestore

class StudentsClient {
    
    // Atributos
    
    let studentsCollection: CollectionReference
    
    // Inicializar la clase
    
    init() {
        // Inicializar base de datos
        let db = Firestore.firestore()
        
        // Inicializar referencia a los estudiantes
        studentsCollection = db.collection("alumnos")
    }
    
    func getStudentProfile(studentId: String, completionHandler: @escaping(Error?, Student?) -> Void) {
        studentsCollection.document(studentId).getDocument { (snapshot, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let snapshot = snapshot {
                if let data = snapshot.data() {
                    if let student = Student(studentData: data) {
                        completionHandler(nil, student)
                    } else {
                        completionHandler(StudentsError.invalidData, nil)
                    }
                } else {
                    completionHandler(StudentsError.noDataObject, nil)
                }
            }
        }
    }
    
}

enum StudentsError: Error {
    case invalidData
    case noDataObject
}

extension StudentsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Los datos del estudiante no son válidos", comment: "")
        case .noDataObject:
            return NSLocalizedString("No se encontró el objeto data", comment: "")
        }
    }
}
