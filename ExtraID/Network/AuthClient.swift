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
    
    // Iniciar sesión como profesor
    func teacherSignIn(email: String, password: String, completionHandler: @escaping(Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            completionHandler(error)
        }
    }
    
}
