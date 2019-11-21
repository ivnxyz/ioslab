//
//  ViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var teachersClient: TeachersClient = {
       return TeachersClient()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        teachersClient.getTeacherProfile(teacherId: "KC7eobNOW1KIR9mluPYw") { (error, teacher) in
            print(teacher?.name)
        }
    }


}

