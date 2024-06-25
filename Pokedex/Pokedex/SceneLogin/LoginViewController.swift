//
//  ViewController.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    func configElements() {
        enterButton.setTitle("Entrar", for: .normal)
    }

    @IBAction func didTapEnterButton(_ sender: UIButton) {
        
        let homeScreen = UIStoryboard(name: String(describing: HomeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
        navigationController?.pushViewController(homeScreen ?? UIViewController(), animated: true)
    }
    
}

