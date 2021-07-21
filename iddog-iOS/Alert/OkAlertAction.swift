import UIKit

struct OkAlertAction: AlertAction {
    var title: String {
        return "OK"
    }
    
    var style: UIAlertAction.Style {
        return .default
    }
    
    var handler: ((UIAlertAction) -> Void)
    
    init(handler: @escaping ((UIAlertAction) -> Void)) {
        self.handler = handler
    }
}
