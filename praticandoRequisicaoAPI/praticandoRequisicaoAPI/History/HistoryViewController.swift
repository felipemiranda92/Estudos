//
//  ViewController.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 11/06/24.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var viewModel: HistoryViewModel = HistoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHistory()
    }


}

