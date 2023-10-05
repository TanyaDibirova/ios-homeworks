//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook on 03.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: CustomButton = {
        let button = CustomButton(title: "Показать алерт", action: showAlert)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(alertButton)
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
     private func showAlert() {
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
