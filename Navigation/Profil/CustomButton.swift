//
//  CustomButton.swift
//  Navigation
//
//  Created by MacBook on 16.06.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    var buttonTapped:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        layer.cornerRadius = 20.0
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 4.0
        addTarget (self, action: #selector(pressed), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func pressed() {
        buttonTapped?()
    }
    
}
