import UIKit

protocol SignUpViewControllerDelegate: AnyObject {
    func signUpViewControllerDidSignUp(_ viewController: SignUpViewController)
}

protocol SignUpViewProtocol: AnyObject {
    func didLogIn()
    func errorLoggingIn()
}

class SignUpViewController: UIViewController {
    weak var delegate: SignUpViewControllerDelegate?
    private let viewModel: SignUpViewModel
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: LoadableUIButton!
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        // emailTextField
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44))
        emailTextField.leftViewMode = .always

        emailTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44))
        emailTextField.rightViewMode = .always
        
        emailTextField.layer.cornerRadius = 4
        emailTextField.layer.masksToBounds = true
        
        // signUpButton
        signUpButton.layer.cornerRadius = 4
        signUpButton.layer.masksToBounds = true
    }

    @IBAction func signUp(_ sender: UIButton) {
        self.signUpButton.showLoading()
        
        let email = self.emailTextField.text
        self.viewModel.login(email: email)
    }
}

extension SignUpViewController: SignUpViewProtocol {
    func didLogIn() {
        self.signUpButton.hideLoading()
        
        self.delegate?.signUpViewControllerDidSignUp(self)
    }
    
    func errorLoggingIn() {
        self.signUpButton.hideLoading()
        
        let alert = LogInAlert().build()
        self.present(alert, animated: true)
    }
}
