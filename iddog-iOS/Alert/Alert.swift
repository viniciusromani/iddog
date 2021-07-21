import UIKit

protocol Alert {
    var title: String { get }
    var message: String { get }
    var style: UIAlertController.Style { get }
    var actions: [AlertAction] { get }
    
    func build() -> UIAlertController
}
extension Alert {
    func build() -> UIAlertController {
        let controller = UIAlertController(title: self.title,
                                           message: self.message,
                                           preferredStyle: self.style)
        self.actions.forEach { controller.addAction($0.build()) }
        return controller
    }
}

protocol AlertAction {
    var title: String { get }
    var style: UIAlertAction.Style { get }
    var handler: ((UIAlertAction) -> Void) { get }
    
    func build() -> UIAlertAction
}
extension AlertAction {
    func build() -> UIAlertAction {
        return UIAlertAction(title: self.title,
                             style: self.style,
                             handler: self.handler)
    }
}
