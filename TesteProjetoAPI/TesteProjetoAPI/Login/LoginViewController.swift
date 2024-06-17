//
//  ViewController.swift
//  TesteProjetoAPI
//
//  Created by Felipe Miranda Santos on 17/06/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.fetchCountryActivies(country: "turkey")
        viewModel.fetchEmbassyAbroad()
        
    }


}

