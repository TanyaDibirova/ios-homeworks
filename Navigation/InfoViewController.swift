//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    let alertButton: UIButton = {
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Показать алерт", for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(alertButton)
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func showAlert() {
        let alertVC = UIAlertController(title: "Это алерт контроллер", message: "Это сообщение", preferredStyle: .alert)
        present(alertVC, animated: true)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let messageAction = UIAlertAction(title: "Сообщение", style: .default) {_ in
            print("Это сообщение из UIAlertController")
        }
        alertVC.addAction(messageAction)
        alertVC.addAction(cancelAction)
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
