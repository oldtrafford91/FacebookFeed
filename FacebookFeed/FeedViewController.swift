import UIKit

class FeedViewController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Home"
    collectionView.backgroundColor = UIColor.collectionViewBackgroundColor
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }


}

