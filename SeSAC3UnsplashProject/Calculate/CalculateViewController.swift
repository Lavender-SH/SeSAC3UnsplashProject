//
//  CalculateViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.textAlignment = .center
        secondTextField.textAlignment = .center
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
            print("First number changed \(number!)")
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
            print("Second number changed \(number!)")
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
    }
    
    
    @objc func firstTextFieldChanged() {
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    @objc func secondTextFieldChanged() {
        viewModel.secondNumber.value = secondTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    
}
    

    
    
    

    
    









//let person = Person("새싹이")
//person.name = "카스타드"
//person.name = "칙촉"
//
//person.introduce { value in
//    self.resultLabel.text = value
//    self.view.backgroundColor = [UIColor.orange, UIColor.lightGray, UIColor.magenta].randomElement()!
//}
//DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//    person.name = "바나나"
//    print("==11==")
//}
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    person.name = "키위"
//    print("==22==")
//}
//
//person.name = "바나나"
//
//firstTextField.text = viewModel.firstNumber.value
//secondTextField.text = viewModel.secondnumber.value


