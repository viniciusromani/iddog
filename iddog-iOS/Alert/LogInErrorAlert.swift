import UIKit

struct LogInAlert: Alert {
    var title: String {
        return "Login Error"
    }
    
    var message: String {
        return "Oops! Detectamos algum erro no seu login, verifique sua internet e o email digitado :)"
    }
    
    var style: UIAlertController.Style {
        return .alert
    }
    
    var actions: [AlertAction] {
        let ok = OkAlertAction { _ in }
        return [ok]
    }
}
