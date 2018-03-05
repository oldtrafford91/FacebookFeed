import UIKit

extension UIColor {
  static let navigationBarTintColor = UIColor(red: 66/255,
                                              green: 103/255,
                                              blue: 178/255,
                                              alpha: 1)
  static let navigationBarTitleTextColor = UIColor.white
  static let collectionViewBackgroundColor = UIColor(white: 0.95, alpha: 1)
  static let secondLineAttributedTextColor = UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }
}
