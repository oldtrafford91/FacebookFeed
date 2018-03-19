import UIKit

class FeedViewController: UICollectionViewController {
  // MARK: - Model
  let posts = FeedPost.allPost()
  
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
    return posts.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.feedCollectionViewCellIdentifier, for: indexPath) as! FeedCollectionViewCell
    let feedPost = posts[indexPath.row]
    feedCell.model = FeedCollectionViewCell.Model(feedPost: feedPost)
    return feedCell
  }
}

// MARK: UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 400)
  }
  
}

