//
//  ViewController.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    @IBAction func didTapEnterButton(_ sender: UIButton) {
        
        let homeScreen = UIStoryboard(name: String(describing: HomeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
        navigationController?.pushViewController(homeScreen ?? UIViewController(), animated: true)
    }
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        
        let registerScreen = UIStoryboard(name: String(describing: RegisterViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as? RegisterViewController
        navigationController?.pushViewController(registerScreen ?? UIViewController(), animated: true)
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func configElements() {
        
        logoLabel.text = "Pokédex"
        logoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        logoLabel.textColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        logoLabel.textAlignment = .center
        
        emailTextField.delegate = self
        emailTextField.placeholder = "Digite seu email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = .done
        
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        enterButton.layer.cornerRadius = 8
        
        registerButton.setTitle("Cadastre aqui", for: .normal)
        registerButton.setTitleColor(UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00), for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.titleLabel?.minimumScaleFactor = 0.5
        registerButton.titleLabel?.lineBreakMode = .byClipping
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            didTapEnterButton(enterButton)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

