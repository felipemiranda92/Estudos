//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Felipe Miranda Santos on 23/07/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen = RegisterScreen?(RegisterScreen())
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        screen?.delegate = self
    }

}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedResgiterButton() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
