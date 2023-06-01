//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit


struct Post {
    let title: String
}

class PostViewController: UIViewController {
    
    
    var post: Post?
    
    let buttonItem: UIButton = {
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Показать инфо", for: .normal)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .lightGray
        navigationItem.title = post?.title ?? ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonItem)
        buttonItem.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
        
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
