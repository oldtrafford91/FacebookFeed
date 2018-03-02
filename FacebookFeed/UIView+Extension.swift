import UIKit

extension UIView {
  func addConstraintWithVisualFormat(format: String, views: UIView...) {
    var viewDictionary = [String: UIView]()
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      viewDictionary[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                  options: [],
                                                  metrics: nil,
                                                  views: viewDictionary))
    
  }
}
