
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let logo  = UIImage(named: "logo")
    private var curentUserInit: UserService?
    var loginDelegate: LoginViewControllerDelegate?
    
    private lazy var scollView: UIScrollView = {
        let scrollVieww = UIScrollView()
        
        scrollVieww.showsVerticalScrollIndicator = false
        scrollVieww.translatesAutoresizingMaskIntoConstraints = false
        return scrollVieww
    }()
    
    
    
    private lazy var contentView: UIView = {
        let contentVieww = UIView()
        
        contentVieww.translatesAutoresizingMaskIntoConstraints = false
        return contentVieww
    }()
    
    
    private lazy var imageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private lazy var textField: UITextField = { [unowned self] in
        let text = UITextField()
        //    text.translatesAutoresizingMaskIntoConstraints = false
        let spacerView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 10))
        text.leftViewMode = .always
        text.leftView = spacerView
        text.placeholder = "Email of phone"
        text.text = "dibirova"
        text.font = UIFont.systemFont(ofSize: 16)
        text.autocorrectionType = UITextAutocorrectionType.no
        text.returnKeyType = UIReturnKeyType.done
        text.keyboardType = UIKeyboardType.default
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        text.delegate = self
        return text
    }()
    
    private lazy var passField: UITextField = { [unowned self] in
        let passTF = UITextField()
        //    passTF.translatesAutoresizingMaskIntoConstraints = false
        let spacerView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 10))
        passTF.leftViewMode = .always
        passTF.leftView = spacerView
        passTF.placeholder = "Password"
        passTF.text = "8888"
        passTF.font = UIFont.systemFont(ofSize: 16)
        passTF.autocorrectionType = UITextAutocorrectionType.no
        passTF.returnKeyType = UIReturnKeyType.done
        passTF.keyboardType = UIKeyboardType.default
        passTF.isSecureTextEntry = true
        passTF.clearButtonMode = UITextField.ViewMode.whileEditing
        passTF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passTF.delegate = self
        return passTF
    }()
    
    private lazy var containerView: UIStackView  = { [unowned self] in
        let v = UIStackView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.layer.cornerRadius = 10
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        v.clipsToBounds = true
        return v
        
    }()
    
    private lazy var separatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    private lazy var editButton: CustomButton = {
        let button = CustomButton(title: "Log in", action: pressed)
        return button
    }()
                                  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.curentUserInit = CurrentUserService()
#if DEBUG
        curentUserInit = TestUserService(testUser: User(login: "dibirova", fullName: "Test User", avatar: UIImage(named: "2")!, status: "Testing status"))
#else
        curentUserInit = CurrentUserService(user: User(login: "tanya8", fullName: "Dibirova Tanya", avatar: UIImage(named: "14")!, status: "Happiness is a state of activity"))
#endif
        view.backgroundColor = .white
        
        setupView()
        addSubviews()
        setupConstrains()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
        
    }
    
    // MARK: - Actions
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        if scollView.contentInset.bottom == 0.0 {
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
            scollView.contentInset.bottom += (keyboardHeight ?? 0.0) + 20
        }
        
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scollView.contentInset.bottom = 0.0
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "ScrollView examle"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    private func addSubviews() {
        imageView.image = logo
        
        containerView.addArrangedSubview(textField)
        containerView.addArrangedSubview(separatorView)
        containerView.addArrangedSubview(passField)
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
        passField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
        
        // setupConstrainsForContainerView()
        contentView.addSubview(imageView)
        contentView.addSubview(containerView)
        contentView.addSubview(editButton)
        scollView.addSubview(contentView)
        view.addSubview(scollView)
    }
    
    /*
     private func addSubviews() {
     imageView.image = logo
     
     containerView.addArrangedSubview(self.textField)
     containerView.addArrangedSubview(separatorView)
     containerView.addArrangedSubview(self.passField)
     separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
     textField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
     passField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
     
     // setupConstrainsForContainerView()
     
     
     view.addSubview(imageView)
     
     view.addSubview(containerView)
     
     view.addSubview(scollView)
     scollView.addSubview(contentView)
     view.addSubview(editButton)
     
     }
     */
    
    private func setupConstrains() {
        //   let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:contentView.topAnchor,constant: 120),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            containerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            scollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scollView.topAnchor.constraint(equalTo: view.topAnchor),
            scollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            editButton.topAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 16),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scollView.bottomAnchor)
        ])
        
    }
    
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func pressed() {
        
        guard let login = textField.text else {return}
        guard let pass = passField.text else {return}
        guard let deleg = loginDelegate else {return}
        
        if deleg.check(login: login, password: pass) {
            guard let user = curentUserInit?.userService(login: login) else {
                print("User not found")
                return
            }
            print(deleg.check(login: login, password: pass))
       // guard let login = textField.text else {return}
      //  if let user = curentUserInit?.userService(login: login) {
            
            let profileView = ProfileViewController(user: user)
            self.navigationController?.pushViewController(profileView, animated: true)
            print("OLA USER ")
        } else {
            
            print("user not found in login vc")
            let aleart = UIAlertController(title: "Login Wrong", message: "You entered wrong login. Please change it", preferredStyle: .alert)
            let action  = UIAlertAction(title: "Change", style: .destructive)
            aleart.addAction(action)
            present(aleart, animated: true)
        }
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension LogInViewController: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        return ((loginDelegate?.check(login: login, password: password)) != nil)
    }

}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


