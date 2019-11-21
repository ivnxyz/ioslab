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
    func getTeacherProfile(teacherId: String) {
        teachersCollection.document(teacherId).getDocument { (snapshot, error) in
            if let error = error {
                print("Hubo un error: ", error)
            } else if let snapshot = snapshot {
                print(snapshot.data())
            }
        }
    }
    
    
}
