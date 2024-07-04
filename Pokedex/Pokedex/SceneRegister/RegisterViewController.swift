//
//  RegisterViewController.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 03/07/24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var backHomeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }

    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        registerUser()
    }

    @IBAction func didTapBackHomeButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    func registerUser() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.showAlert(message: "Erro -> \(error.localizedDescription)")
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func configElements() {
        logoLabel.text = "Pokédex"
        logoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        logoLabel.textColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        logoLabel.textAlignment = .center

        nameTextField.delegate = self
        nameTextField.placeholder = "Digite seu nome"
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocapitalizationType = .words
        nameTextField.returnKeyType = .next

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

        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        registerButton.layer.cornerRadius = 8
        registerButton.setNeedsLayout()
        registerButton.layoutIfNeeded()

        backHomeButton.setTitle("Já tem cadastro?", for: .normal)
        backHomeButton.setTitleColor(UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00), for: .normal)
        backHomeButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
    }
}


