import UIKit

extension UICollectionView {
    func registerCell(_ cellClass: UICollectionViewCell.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }

    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Cell of type \(String(describing: T.self)) was not registred on collection view")
        }

        return cell
    }
    
    func reloadAnimated() {
        UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.reloadData()
        }, completion: nil)
    }
}
