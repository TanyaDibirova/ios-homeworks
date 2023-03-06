import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var maImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    let cat = UIImage(named: "cat")
    
    private lazy var catLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
     private lazy var waitingLabel: UILabel = {
        let waiting = UILabel()
        waiting.translatesAutoresizingMaskIntoConstraints = false
        waiting.text = "Waiting for something"
        waiting.font = UIFont(name: "Regular", size: 14)
        waiting.textColor = UIColor.gray
        return waiting
    }()



    private lazy var editButton: UIButton = {
        let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Status", for: .normal)
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

    
    
    convenience init(title: String) {
        self.init(frame: .zero)
        
        catLabel.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        self.setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSelf() {
        maImageView.image = cat
        self.addSubview(self.maImageView)
        self.addSubview(self.catLabel)
        self.addSubview(self.waitingLabel)
        self.addSubview(self.editButton)
        
        NSLayoutConstraint.activate([
           
            self.maImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            self.maImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            self.maImageView.widthAnchor.constraint(equalToConstant: 100),
            self.maImageView.heightAnchor.constraint(equalToConstant: 100),
        
            self.catLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            self.catLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 132),
        
            self.waitingLabel.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -52),
            self.waitingLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 132),
     
            self.editButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            self.editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            self.editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            self.editButton.heightAnchor.constraint(equalToConstant: 50),
            self.editButton.topAnchor.constraint(equalTo: maImageView.bottomAnchor, constant: 20)
            
        ])
        
    }
                                
    
    @objc func pressed() {
        print("Waiting for something...")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}





