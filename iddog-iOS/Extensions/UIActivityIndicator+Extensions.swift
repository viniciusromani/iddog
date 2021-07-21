import UIKit

extension UIActivityIndicatorView {
    convenience init(style: UIActivityIndicatorView.Style, color: UIColor) {
        self.init(style: style)
        self.color = color
    }
}
