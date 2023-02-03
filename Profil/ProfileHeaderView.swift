import UIKit

class ProfileHeaderView: UIView {
    
    var maImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    let cat = UIImage(named: "cat")
    
    var catLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    var waitingLabel: UILabel = {
        let waiting = UILabel()
        waiting.translatesAutoresizingMaskIntoConstraints = false
        waiting.text = "Waiting for something"
        waiting.font = UIFont(name: "Regular", size: 14)
        waiting.textColor = UIColor.gray
        return waiting
    }()
    
    var myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sho status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20.0
        button.addTarget(ProfileHeaderView.self, action: #selector(pressed), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        return button
    }()
    
    
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        maImageView.image = cat
        addSubview(maImageView)
        
        maImageView.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        maImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        maImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        maImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    
        addSubview(catLabel)
        
        catLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        catLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 140).isActive = true

      
        addSubview(waitingLabel)
        addSubview(myButton)
        
        waitingLabel.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -34).isActive = true
       waitingLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 140).isActive = true
        //waitingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140).isActive = true
        

        myButton.topAnchor.constraint(equalTo: maImageView.bottomAnchor, constant: 16).isActive = true
        myButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    
    }
                                
    
    
    @objc func pressed() {
        print("Waiting for something...")
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
