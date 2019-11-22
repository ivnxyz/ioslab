//
//  ViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit
import LocalAuthentication
import FirebaseAuth

class ViewController: UIViewController {

    // MARK: - Atributos
    
    lazy var teachersClient: TeachersClient = {
       return TeachersClient()
    }()
    
    lazy var authClient: AuthClient = {
        return AuthClient()
    }()
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var touchIdButton: UIButton!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mostrar/ocultar botón de touch id
        if (Auth.auth().currentUser == nil) {
            touchIdButton.isHidden = true
        } else {
            touchIdButton.isHidden = false
        }
    }
    
    @IBAction func TouchID(_ sender: Any) {
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "showHomeScreen", sender: nil)
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            print( "Sorry!!... User did not authenticate successfully")
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                print( "Sorry!!.. Could not evaluate policy.")
            }
        } else {
            // Fallback on earlier versions
            
            print("successLabel.text = Ooops!!.. This feature is not supported.")
        }
    }
    
    // MARK: - Acciones
    
    @IBAction func logIn(_ sender: Any) {
        // Iniciar sesión con el email y la contraseña
        if let email = emailTextField.text, let password = passwordTextField.text {
            authClient.teacherSignIn(email: email, password: password) { (error) in
                if let error = error {
                    print("Ocurrió un error al iniciar sesión: \(error)")
                } else {
                    self.performSegue(withIdentifier: "showHomeScreen", sender: nil)
                }
            }
        }
    }
}


