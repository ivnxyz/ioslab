//
//  CustomTextField.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {
    
    // MARK: - ATRIBUTOS
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleButton()
    }
    
    override func prepareForInterfaceBuilder() {
        styleButton()
    }
    
    // MARK: - Métodos
    
    func styleButton() {
        // Configurar bordes
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = bounds.size.height/2
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
