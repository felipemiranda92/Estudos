//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Felipe Miranda Santos on 22/07/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen = LoginScreen?(LoginScreen())
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        screen?.delegate = self
    }


}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}

