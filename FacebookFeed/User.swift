import Foundation
struct User {
  let name: String
  let profileImage: String
}

extension User {
  static let mark = User(name: "Mark Zukerberg", profileImage: "zuckprofile")
  static let steve = User(name: "Steve Job", profileImage: "steve_profile")
  static func allUser() -> [User] {
    return [mark, steve]
  }
}
