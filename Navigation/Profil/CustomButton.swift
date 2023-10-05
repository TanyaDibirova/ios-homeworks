//
//  CustomButton.swift
//  Navigation
//
//  Created by MacBook on 16.06.2023.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    typealias Action = () -> Void

    var buttonAction: Action

    init(title: String, titleColor: UIColor = .white, bgColor: UIColor = .black, action: @escaping Action) {
        buttonAction = action
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
                layer.cornerRadius = 20.0
                layer.shadowOpacity = 0.7
                layer.shadowRadius = 2.0

    // setup appearance
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("lol")
    }

    @objc private func buttonTapped() {
        buttonAction()
    }
}

/*
  button.translatesAutoresizingMaskIntoConstraints = false
 button.setTitle("Log in", for: .normal)
 button.setTitleColor(.white, for: .normal)
 button.backgroundColor = .systemBlue
 button.buttonTapped = { [weak self] in self?.pressed()
 }
 button.layer.shadowColor = UIColor.black.cgColor
 button.layer.shadowOffset = CGSize(width: 4, height: 4) */
