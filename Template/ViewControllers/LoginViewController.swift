import UIKit

private let loginButtonPaddingY: CGFloat = 50.0
private let loginComponentFontSize: CGFloat = 16.0
private let loginComponentHeight: CGFloat = 30.0
private let loginComponentWidth: CGFloat = 200.0
private let passwordFieldPaddingY: CGFloat = 10.0
private let titleLabelFontSize: CGFloat = 22.0
private let titleLabelHeight: CGFloat = 22.0
private let titleLabelWidth: CGFloat = 150.0
private let usernameFieldPaddingY: CGFloat = 50.0

protocol LoginViewControllerDelegate: AnyObject {
    func didAuthenticateUser(_ loginViewController: LoginViewController, user: User)
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: LoginViewControllerDelegate?
    
    private let titleLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Fit:Match.ai"
        titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabelFontSize)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .blue
        
        usernameField.textColor = .black
        usernameField.borderStyle = .roundedRect
        usernameField.font = UIFont.systemFont(ofSize: loginComponentFontSize)
        usernameField.layer.cornerRadius = 5.0
        usernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        passwordField.textColor = .black
        passwordField.borderStyle = .roundedRect
        passwordField.font = UIFont.systemFont(ofSize: loginComponentFontSize)
        passwordField.layer.cornerRadius = 5.0
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])

        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 5.0
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: loginComponentFontSize)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        titleLabel.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - titleLabelWidth / 2, 100, titleLabelWidth, titleLabelHeight)
        usernameField.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - loginComponentWidth / 2,
                                         CGRectGetMaxY(titleLabel.frame) + usernameFieldPaddingY,
                                         loginComponentWidth,
                                         loginComponentHeight)
        passwordField.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - loginComponentWidth / 2,
                                         CGRectGetMaxY(usernameField.frame) + passwordFieldPaddingY,
                                         loginComponentWidth,
                                         loginComponentHeight)
        loginButton.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - loginComponentWidth / 2,
                                       CGRectGetMaxY(passwordField.frame) + loginButtonPaddingY,
                                       loginComponentWidth,
                                       loginComponentHeight)
    }
    
    // MARK: - Helpers
    @objc private func didTapLoginButton() {
        if usernameField.text == "Nikkitran" && passwordField.text == "12345" {
            let models = getModels()
            let user = User(id: "1", email: "random@gmail.com", username: "Nikkitran", models: models)
            delegate?.didAuthenticateUser(self, user: user)
            DispatchQueue.main.async {
                self.dismiss(animated: true)
            }
        }
    }
    
}
