
import SnapKit
import UIKit

class ProfileHeaderView: UIView {
    
    private var originFrame: CGRect = .zero
    
    lazy var someView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    lazy var someButton: UIButton = {
        let b = UIButton()
        b.setBackgroundImage(UIImage(named: "close"), for: .normal)
        b.addTarget(self, action: #selector(reverseAnimation), for: .touchUpInside)
        return b
    }()
    
    lazy var maImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        
        let tapImage = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapImage)
        )
        image.addGestureRecognizer(tapImage)
        return image
    }()
    let cat = UIImage(named: "cat")
    var widthcCon: NSLayoutConstraint!
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
        maImageView.isUserInteractionEnabled = true

        widthcCon = self.maImageView.widthAnchor.constraint(equalToConstant: 100)
                addSubview(catLabel)
                self.addSubview(self.waitingLabel)
                self.addSubview(self.editButton)
                self.addSubview(self.maImageView)
            
                
                maImageView.snp.makeConstraints { (make) -> Void in
                    make.top.equalTo(self).offset(22)
                    make.left.equalTo(self).offset(16)
                    make.size.equalTo(CGSize(width: 100, height: 100))
                }
            
                catLabel.snp.makeConstraints { (make) -> Void in
                    make.left.equalTo(self).offset(132)
                    make.top.equalTo(self).offset(20)
                }
                waitingLabel.snp.makeConstraints {
                    $0.top.equalTo(catLabel).offset(20)
                    $0.bottom.equalTo(editButton).offset(-52)
                    $0.left.equalTo(self).offset(132)
                    $0.trailing.equalTo(self).offset(-16)
                }
                editButton.snp.makeConstraints {
                    $0.top.equalTo(maImageView.snp.bottom).offset(16)
                    $0.bottom.equalTo(self).offset(-16)
                    $0.left.equalTo(self).offset(16)
                    $0.trailing.equalTo(self).offset(-16)
                    $0.size.equalTo(CGSize(width: 100, height: 50))
                }
        
  /*
        NSLayoutConstraint.activate([
           
            self.maImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            self.maImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            widthcCon,
            self.maImageView.heightAnchor.constraint(equalToConstant: 100),
        
            self.catLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            self.catLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 132),
        
            self.waitingLabel.topAnchor.constraint(equalTo: catLabel.bottomAnchor, constant: 20),
            self.waitingLabel.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -52),
            self.waitingLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 132),
            self.waitingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
     
            self.editButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            self.editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            self.editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            self.editButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
  
   */
    }
    
    func animateSize(width: CGFloat, height: CGFloat) {
        CATransaction.begin()
        let sizeAnimation = CABasicAnimation(keyPath: "bounds.size")
        sizeAnimation.duration = 2
        sizeAnimation.isRemovedOnCompletion = false
        sizeAnimation.toValue = CGSize(width: width, height: width)
        maImageView.layer.add(sizeAnimation, forKey: "bounds.size")
        maImageView.layer.bounds.size = CGSize(width: width,
                                               height: width)
        CATransaction.commit()
    }
    
    func imageAnimationExample() {
        originFrame = maImageView.frame
        let centerOrigin = superview!.center//.center
        maImageView.translatesAutoresizingMaskIntoConstraints = true
        UIView.animate(withDuration: 0.5) {
            self.maImageView.layer.cornerRadius = 0
            self.maImageView.center = CGPoint(
                x: centerOrigin.x,
                y: centerOrigin.y
            )
            self.animateSize(width: self.superview!.frame.width,
                             height: self.superview!.frame.width)
        }
        addSomeView()
        UIView.animate(withDuration: 0.5) {
            self.someView.alpha = 1
        }
        addSomeButton()
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.someButton.alpha = 1
        }
    }
    
    func addSomeView() {
        someView.alpha = 0
        someView.frame = CGRect(x: maImageView.frame.origin.x,
                                y: maImageView.frame.origin.y + maImageView.frame.height + 40,
                                width: maImageView.frame.width,
                                height: 50)
        addSubview(someView)
    }
    
    func addSomeButton() {
        someButton.alpha = 0
        someButton.frame = CGRect(x: superview!.frame.width - 80,
                                  y: 80,
                                  width: 50,
                                  height: 50)
        addSubview(someButton)
    }
    
    @objc func pressed() {
        print("Waiting for something...")
    }
    
    @objc private func didTapImage() {
        imageAnimationExample()
    }
    
    @objc private func reverseAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.someButton.alpha = 0
        } completion: { finished in
            if finished {
                self.someButton.removeFromSuperview()
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.maImageView.frame = self.originFrame
            self.maImageView.layer.cornerRadius = self.originFrame.width / 2
            self.someView.alpha = 0
            self.animateSize(width: self.originFrame.width, height: self.originFrame.width)
        } completion: { finished in
            if finished {
                self.someView.removeFromSuperview()
                self.maImageView.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

