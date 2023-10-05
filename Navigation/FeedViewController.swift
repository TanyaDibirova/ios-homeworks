//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITextFieldDelegate {

   private let feedModel = FeedModel()

    private lazy var postButton: CustomButton = {
        let button = CustomButton(title: "Показать пост", action: showPost)
        return button
    }()

    private lazy var  scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var chekLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Результат проверки"
        label.textColor = .gray
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()

    private lazy var password: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.white.cgColor
        textField.backgroundColor = .lightGray
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.isEnabled = true
        textField.textAlignment = .center
        textField.becomeFirstResponder()
        textField.placeholder = "Enter password - secret"
        textField.delegate = self
        return textField
    }()

    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "ChekPassword", action: checkPasswordButtonAction)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

  private  func setupConstraints() {
        view.addSubview(scrollView)
      view.addSubview(postButton)
        scrollView.addSubview(chekLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(checkGuessButton)
        stackView.addSubview(password)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 400),
            
            password.heightAnchor.constraint(equalToConstant: 50),
            password.widthAnchor.constraint(equalToConstant: 200),
            password.topAnchor.constraint(equalTo: chekLabel.bottomAnchor, constant: 150),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            checkGuessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkGuessButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: password.bottomAnchor,constant: 16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            
            postButton.heightAnchor.constraint(equalTo: checkGuessButton.heightAnchor),
            postButton.widthAnchor.constraint(equalTo: checkGuessButton.widthAnchor),
            postButton.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 16),
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            chekLabel.heightAnchor.constraint(equalToConstant: 50),
            chekLabel.widthAnchor.constraint(equalToConstant: 200),
            chekLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            chekLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func checkPasswordButtonAction() {
        guard let text = self.password.text  else {return}
        if feedModel.chek(word: text) == true {
            self.chekLabel.isHidden = false
            self.chekLabel.textColor = .systemGreen
            self.chekLabel.text = "Пароль верный"
            print("true")
        } else {
            self.chekLabel.isHidden = false
            self.chekLabel.textColor = .systemRed
            self.chekLabel.text = "Парль не верный"
            print(false)
        }
    }

    private func showPost() {
        let post = Post(title: "Мой первый пост")
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
