import UIKit

class FeedViewController: UICollectionViewController {
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Home"
    setupCollectionView()
  }
  
  // MARK: - Setup
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  fileprivate func setupCollectionView() {
    collectionView.alwaysBounceVertical = true
    collectionView.backgroundColor = UIColor.collectionViewBackgroundColor
    collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: Constant.feedCollectionViewCellIdentifier)
  }
}

// MARK: - UICollectionViewDataSource
extension FeedViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.feedCollectionViewCellIdentifier, for: indexPath) as! FeedCollectionViewCell

    return feedCell
  }
}

// MARK: UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 400)
  }
  
}

