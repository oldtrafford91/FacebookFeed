import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  let nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.attributedText = labelText
    return label
  }()
  
  private static let labelText: NSAttributedString = {
    let attributedString = NSMutableAttributedString(string: "Mark Zuckerberg",
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
  }()
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "zuckprofile")
    return imageView
  }()
  
  let statusTextView: UITextView = {
    let textView = UITextView()
    textView.text = "This is my first status on Facebook"
    textView.font = UIFont.systemFont(ofSize: 14)
    return textView
  }()
  
  let statusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage(named: "zuckdog")
    imageView.clipsToBounds = true
    return imageView
  }()
  
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
    addSubview(nameLabel)
    addSubview(profileImageView)
    addSubview(statusTextView)
    addSubview(statusImageView)
    addConstraintWithVisualFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
    addConstraintWithVisualFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]|", views: profileImageView, statusTextView, statusImageView)
    addConstraintWithVisualFormat(format: "V:|-12-[v0]", views: nameLabel)
    addConstraintWithVisualFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
    addConstraintWithVisualFormat(format: "H:|[v0]|", views: statusImageView)
  }
}
