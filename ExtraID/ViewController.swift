//
//  ViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    var abre = HomeViewController()
    lazy var teachersClient: TeachersClient = {
       return TeachersClient()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        teachersClient.getTeacherProfile(teacherId: "KC7eobNOW1KIR9mluPYw") { (error, teacher) in
            print(teacher?.subjectsIds)
        }
    }
    
    /*func showErrorMessageForLAErrorCode( errorCode:Int ) -> String{
        
        var message = ""
        
        switch errorCode {
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
            
        }
        
        return message
        
    }

    func authenticateUserTouchID() {
    let context : LAContext = LAContext()
    // Declare a NSError variable.
    let myLocalizedReasonString = "Authentication is needed to access your Home ViewController."
    var authError: NSError?
    if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
    context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
    if success // IF TOUCH ID AUTHENTICATION IS SUCCESSFUL, NAVIGATE TO NEXT VIEW CONTROLLER
    {
    DispatchQueue.main.async{
    print("Authentication success by the system")
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    self.navigationController?.pushViewController(homeVC, animated: true)
    }
    }
    else // IF TOUCH ID AUTHENTICATION IS FAILED, PRINT ERROR MSG
     {
    if let error = authError {
        let message = self.showErrorMessageForLAErrorCode(errorCode: error.code)
    print(message)
                         }
     }
    }
    }
    }

    @IBAction func clickLoginButton(_ sender: Any) {
        self.authenticateUserTouchID()
    }*/
  
    @IBAction func TouchID(_ sender: Any) {
        print("hello there!.. You have clicked the touch ID")
                
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
    
    
 func transition()
 {
     //Current Code, default colour is black
    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
       if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? UIViewController {
           self.present(viewController, animated: true, completion: nil)
       }

  }
    }


