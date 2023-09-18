//
//  NumberViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/18.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    func bindData() {
        
        viewModel.number.bind { jack in
            self.numberTextField.text = jack
        }
        viewModel.result.bind { value in
            self.resultLabel.text = value
        }
    }
     
    
    @objc func numberTextFieldChanged() {
        print(#function)
        viewModel.number.value = numberTextField.text
        viewModel.convertNumber()
    }
    
}
