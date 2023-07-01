//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    

    let postButton: UIButton = {
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Показать пост", for: .normal)
        return b
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
        label.text = ""
        label.isHidden = true
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var password: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.white.cgColor
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.placeholder = "Enter password"
        textField.text = "secret"
        textField.tag = 0
        return textField
    }()
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "ChekPassword")
        button.translatesAutoresizingMaskIntoConstraints = false
        let feedModel = FeedModel()
        button.buttonTapped = {
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
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        view.addSubview(postButton)
        postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupUI(){
        setupConstraints()
    
    }
    
    func setupConstraints() {
        view.addSubview(scrollView)
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
            
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            checkGuessButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            checkGuessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            chekLabel.heightAnchor.constraint(equalToConstant: 50),
            chekLabel.widthAnchor.constraint(equalToConstant: 200),
            chekLabel.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -16),
            chekLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

    @objc func showPost() {
        let post = Post(title: "Мой первый пост")
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
