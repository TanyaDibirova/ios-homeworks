//
//  ViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Лента пользователя"
       var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
    
        self.tabBarItem = tabBarItem
        self.view.backgroundColor = .systemGray2
    
    }
    private lazy var button: UIButton = {

            let button = UIButton()

            button.backgroundColor = .blue

            button.layer.cornerRadius = 12

            button.setTitle("Перейти на пост", for: .normal)

            button.setTitleColor(.lightGray, for: .normal)

            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)

            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            button.translatesAutoresizingMaskIntoConstraints = false

            return button

        }()
    
    private func setupButton() {

            self.view.addSubview(self.button)

            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true

            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true

            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true

            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        }
    @objc private func buttonAction() {

           let postViewController = PostViewController()

           self.navigationController?.pushViewController(postViewController, animated: true)
        


}
}


