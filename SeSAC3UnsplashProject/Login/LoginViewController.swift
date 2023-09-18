//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(viewModel.id.value)
        print(viewModel.pw.value)
        
        viewModel.id.value = "아이디 텍스트 변경했습니다."
        viewModel.pw.value = "비밀번호 텍스트 변경했습니다."
        
        print(viewModel.id.value)
        print(viewModel.pw.value)
        
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        viewModel.id.bind { text in
            print("ID Bind : \(text)")
            self.idTextField.text = text
        }

        viewModel.pw.bind { text in
            print("PW Bind : \(text)")
            self.pwTextField.text = text
        }

        viewModel.isValid.bind { bool in
            print("isValid Bind: \(bool)")
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = !bool ? .lightGray : .purple
        }
    }
    
    @objc func idTextFieldChanged() {
        print(#function)
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func pwTextFieldChanged() {
        print(#function)
        viewModel.pw.value = pwTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func loginButtonClicked() {
        print("로그인 성공했기 때문에 성공 얼럿 띄우기")
        viewModel.signIn {
            let id = UserDefaults.standard.string(forKey: "id")
//            print("id: \(id)")
        }
    }
     
}
