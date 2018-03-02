import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Sample"
    label.backgroundColor = UIColor.gray
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = UIColor.red
    imageView.translatesAutoresizingMaskIntoConstraints = false
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
    addConstraintWithVisualFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
    addConstraintWithVisualFormat(format: "V:|-8-[v0(44)]", views: profileImageView)
    addConstraintWithVisualFormat(format: "V:|[v0]|", views: nameLabel)
  }
}
