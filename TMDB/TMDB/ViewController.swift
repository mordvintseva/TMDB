import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var entryButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextFields()
        setOutletsText()
    }

}

// MARK: - Private Methods

private extension ViewController {
    func setupTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self

        emailTextField.tag = 0
        passwordTextField.tag = 1
    }

    func setOutletsText() {
        emailLabel.text = "Email"
        passwordLabel.text = "Password"
        entryButton.setTitle("Entry", for: .normal)
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
