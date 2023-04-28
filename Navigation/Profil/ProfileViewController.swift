//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 04.02.2023.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    fileprivate let menu = Menu.make()
    let headerView = ProfileHeaderView()
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
 
    private enum CellReuseID: String {
        case base = "PostTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
   
    private enum HeaderFooterReuseID: String {
        case base = "TableSectionFooterHeaderView_ReuseID"
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        menu.count
    }
    
    private var user: UserService?
    
    init(user: UserService) {
 
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cellImages = tableView.dequeueReusableCell(withIdentifier: CellReuseID.custom.rawValue, for: indexPath) as? PhotosTableViewCell else {
            print("could not dequeueReusableCell - cellImages")
            return UITableViewCell()
        }
        guard let cellPost = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        if indexPath.row == 0 {
            cellImages.configure(photos: Fhotos.make())
            return cellImages
        } else {
            cellPost.update(menu[indexPath.row])
            return cellPost
        }
           /*
       guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
     cell.update(menu[indexPath.row])
       cell.configure(post: menu[indexPath.row])
        return cell
    */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setupView()
        addSubviews()
        headerView.setupView(user: user as! User)
        setupConstraints()
        tuneTableView()
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        headerView.imageAnimationExample()
        
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
        navigationItem.title = "Нетология"
        navigationController?.navigationBar.prefersLargeTitles = false

}
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
        ])
    }
    
    
    private func tuneTableView() {
        tableView.estimatedRowHeight = 44.0
        
        
        tableView.setAndLayout(headerView: headerView)
        tableView.tableFooterView = UIView()
        

        tableView.register(
            PostTableViewCell.self,
                   forCellReuseIdentifier: CellReuseID.base.rawValue
               )
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.custom.rawValue)
       
       
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}



    
    
    
    
    
    
    
    

    /*
    private lazy var profileHeaderView: ProfileHeaderView  = {
        let profileHeader = ProfileHeaderView()
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        self.view.addSubview(self.profileHeaderView)
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
        
        ])
        

}
 */
    

     
    
