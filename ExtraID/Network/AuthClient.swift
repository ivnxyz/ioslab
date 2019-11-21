//
//  AuthClient.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthClient {
    
    let teachersClient: TeachersClient
    
    init() {
        teachersClient = TeachersClient()
    }
    
    // Registrar a un nuevo maestro en la aplicación
    func teacherSignUp(email: String, password: String, name: String, completionHandler: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completionHandler(error)
            } else if let result = result {
                let userId = result.user.uid
                
                // Guardar el nombre del profesor
                self.teachersClient.saveTeacherName(name: name, teacherId: userId) { (error) in
                    completionHandler(error)
                }
            }
        }
    }
    
    
    // Iniciar sesión como profesro
    func teacherSignIn(email: String, password: String, completionHandler: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            completionHandler(error)
        }
    }
    
}
