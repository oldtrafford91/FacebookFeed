import Foundation

struct FeedPost {
  let user: User
  let image: String?
  let status: String?
}

extension FeedPost {
  static let zackPost = FeedPost(user: User.mark, image: "zuckdog", status: "This is my cute dog")
  static let stevePost = FeedPost(user: User.steve, image: "steve_status", status: "Stay focus")
  static func allPost() -> [FeedPost] {
    return [zackPost, stevePost]
  }
}
