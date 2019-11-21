//
//  CustomButton.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/11/19.
//  Copyright © 2019 Macnificos. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
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
    
    func styleButton() {
        // Configurar bordes
        layer.backgroundColor = UIColor(red: 0, green: 44/255, blue: 83/255, alpha: 1).cgColor
        layer.cornerRadius = bounds.size.height/2
        setTitleColor(.white, for: .normal)
    }
    
}
