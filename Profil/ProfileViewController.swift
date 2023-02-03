//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 04.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeader: ProfileHeaderView  = {
        let profile = ProfileHeaderView()
     //   profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        

        }
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
        profileHeader.frame = view.frame
        
        view.addSubview(profileHeader)
        
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
