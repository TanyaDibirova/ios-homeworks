

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
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
    let logo  = UIImage(named: "logo")
    
    
    
    private lazy var textField: UITextField = { [unowned self] in
        let text = UITextField()
    //    text.translatesAutoresizingMaskIntoConstraints = false
        let spacerView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 10))
        text.leftViewMode = .always
        text.leftView = spacerView
        text.placeholder = "Email of phone"
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
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Log in", for: .normal)
       button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
       button.layer.cornerRadius = 20.0
        button.addTarget (self, action: #selector(pressed), for: .touchUpInside)
       button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 4, height: 4)
       button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
        addSubviews()
        setupConstrains()
        navigationController?.navigationBar.isHidden = true

       view.addSubview(imageView)
       view.addSubview(editButton)
       view.addSubview(containerView)
        scollView.addSubview(contentView)
        
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
        
        containerView.addArrangedSubview(self.textField)
        containerView.addArrangedSubview(separatorView)
        containerView.addArrangedSubview(self.passField)
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
        passField.heightAnchor.constraint(equalToConstant: 49.5).isActive = true
    
        
       view.addSubview(imageView)
        view.addSubview(editButton)
        view.addSubview(containerView)
    
        scollView.addSubview(contentView)
        view.addSubview(scollView)
        
    }
    
    private func setupConstrains() {
     //   let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo:contentView.topAnchor,constant: 120),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
    
    
            containerView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 120),
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
        let profileView = ProfileViewController()

        self.navigationController?.pushViewController(profileView, animated: true)
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

