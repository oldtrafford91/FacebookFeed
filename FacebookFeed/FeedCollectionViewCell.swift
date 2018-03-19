import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  
  // MARK: - Model
  var model: Model? {
    didSet {
      guard let model = model else {
        return
      }
      nameLabel.attributedText = model.nameLabelText
      if let image = model.image {
        statusImageView.image = UIImage(named: image)
      }
      statusTextView.text = model.status
      profileImageView.image = UIImage(named: model.profileImage)
    }
  }
  
  // MARK: - Subviews
  let nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    return label
  }()
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 22
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let statusTextView: UITextView = {
    let textView = UITextView()
    textView.font = UIFont.systemFont(ofSize: 14)
    return textView
  }()
  
  let statusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  let likesCommentsLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12)
    label.text = "400 Likes   10.7K Comments"
    label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
    return label
  }()
  
  let separator: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
    return view
  }()
  
  let buttonStackView: UIStackView = {
    let stackview = UIStackView()
    stackview.alignment = .center
    stackview.axis = .horizontal
    stackview.distribution = .equalSpacing
    return stackview
  }()
  
  let likeButton = buttonForTitle(title: "Like", imageName: "like")
  
  let commentButton = buttonForTitle(title: "Comment", imageName: "comment")
  
  let shareButton = buttonForTitle(title: "Share", imageName: "share")
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup
  func setupViews() {
    backgroundColor = UIColor.white
    for button in [likeButton, commentButton, shareButton] {
      buttonStackView.addArrangedSubview(button)
    }
    
    for view in [nameLabel, profileImageView,
                 statusTextView, statusImageView,
                 likesCommentsLabel, separator,
                 buttonStackView] {
                  addSubview(view)
    }
    
    addConstraintWithVisualFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
    addConstraintWithVisualFormat(format: "V:|-12-[v0]", views: nameLabel)
    addConstraintWithVisualFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
    addConstraintWithVisualFormat(format: "H:|[v0]|", views: statusImageView)
    addConstraintWithVisualFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
    addConstraintWithVisualFormat(format: "H:|-12-[v0]-12-|", views: separator)
    addConstraintWithVisualFormat(format: "H:|-12-[v0]-12-|", views: buttonStackView)
    addConstraintWithVisualFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)]-8-[v5(44)]-8-|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, separator, buttonStackView)
  }
  
  // MARK: - Private Helpers
  private static func buttonForTitle(title: String, imageName: String) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.changeButtonTitleAndImageSpacing(spacing: 8)
    button.setImage(UIImage(named: imageName), for: .normal)
    return button
  }
}

// MARK: - FeedCollectionViewCell View Model
extension FeedCollectionViewCell {
  
  struct Model {
    var nameLabelText: NSAttributedString {
      let attributedString = NSMutableAttributedString(string: name,
                                                       attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
      let secondLine = NSAttributedString(string: "\nDecember 18 - Sanfrancisco   ",
                                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                       NSAttributedString.Key.foregroundColor: UIColor.secondLineAttributedTextColor
        ])
      attributedString.append(secondLine)
      
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = 4
      attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.string.count))
      
      let attachment = NSTextAttachment()
      attachment.image = UIImage(named: "globe_small")
      attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
      attributedString.append(NSAttributedString(attachment: attachment))
      
      return attributedString
    }
    
    let profileImage: String
    let name: String
    var image: String?
    var status: String?
    
    init(feedPost: FeedPost) {
      self.name = feedPost.user.name
      self.profileImage = feedPost.user.profileImage
      if let image = feedPost.image, let status = feedPost.status {
        self.image = image
        self.status = status
      }
    }
  }
}

