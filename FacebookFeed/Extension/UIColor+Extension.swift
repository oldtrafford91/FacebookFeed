import UIKit

extension UIColor {
  static let navigationBarTintColor = UIColor.rgb(red: 66, green: 103, blue: 178)
  static let navigationBarTitleTextColor = UIColor.white
  static let collectionViewBackgroundColor = UIColor(white: 0.95, alpha: 1)
  static let secondLineAttributedTextColor = UIColor.rgb(red: 155, green: 161, blue: 171)
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}
