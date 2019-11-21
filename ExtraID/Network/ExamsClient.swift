//
//  ExamsClient.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ExamsClient {
    
    // Atributos
    
    let examsCollection: CollectionReference
    
    // Inicializar la clase
    
    init() {
        // Inicializar base de datos
        let db = Firestore.firestore()
        
        // Inicializar referencia a los exámenes
        examsCollection = db.collection("examenes")
    }
    
    
    // Obtener un examen por su id
    func getExam(examId: String, completionHandler: @escaping(Error?, Exam?) -> Void) {
        examsCollection.document(examId).getDocument { (snapshot, error) in
            if let error = error {
                completionHandler(error, nil)
            } else if let snapshot = snapshot {
                if let data = snapshot.data() {
                    if let exam = Exam(examData: data) {
                        completionHandler(nil, exam)
                    } else {
                        completionHandler(ExamsError.invalidData, nil)
                    }
                } else {
                    completionHandler(ExamsError.noDataObject, nil)
                }
            }
        }
    }
}

enum ExamsError: Error {
    case invalidData
    case noDataObject
}

extension ExamsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Los datos del examen no son válidos", comment: "")
        case .noDataObject:
            return NSLocalizedString("No se encontró el objeto data", comment: "")
        }
    }
}
