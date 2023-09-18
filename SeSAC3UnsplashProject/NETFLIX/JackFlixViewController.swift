//
//  JackFlixViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/18.
//

import Foundation
import UIKit

class JackFlixViewController: UIViewController {
    
    // MARK: - UI
    let titleLabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "JACKFLIX"
        return label
    }()
    
    let emailTextField = {
        let textField = GrayTextField()
        textField.placeholder = "이메일 주소 또는 전화번호"
        return textField
    }()
    
    let passwordTextField = {
        let textField = GrayTextField()
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    let nicknameTextField = {
        let textField = GrayTextField()
        textField.placeholder = "닉네임"
        return textField
    }()
    
    let locationTextField = {
        let textField = GrayTextField()
        textField.placeholder = "위치"
        return textField
    }()
    
    let recommendationTextField = {
        let textField = GrayTextField()
        textField.placeholder = "추천 코드 입력"
        return textField
    }()
    
    let signUpTextField = {
        let textField = GrayTextField()
        textField.placeholder = "회원가입"
        textField.backgroundColor = .white
        return textField
    }()
    
    let switchButton = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .red
        return switchButton
    }()
    
    let extraLabel = {
        let extraLabel = UILabel()
        extraLabel.text = "추가 정보 입력"
        extraLabel.textColor = .white
        extraLabel.font = UIFont.systemFont(ofSize: 15)
        extraLabel.textAlignment = .center
        return extraLabel
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    let viewModel = JackFlixViewModel()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(recommendationTextField)
        view.addSubview(signUpTextField)
        view.addSubview(switchButton)
        view.addSubview(extraLabel)
        view.addSubview(errorLabel)
        
        jackConstraints()
        emailConstriants()
        passwordConstriants()
        nicknameConstriants()
        locationConstriants()
        recommendationConstriants()
        signUpConstraints()
        switchButtonConstraints()
        extraLabelConstraints()
        errorLabelConstraints()
        
        bindViewModel()
    }
    // MARK: - MVVM
    func bindViewModel() {
        viewModel.email.bind { [weak self] email in
            self?.emailTextField.text = email
        }
        
        viewModel.password.bind { [weak self] password in
            self?.passwordTextField.text = password
        }
        
        viewModel.recommendationCode.bind { [weak self] code in
            self?.recommendationTextField.text = code
        }
        
        viewModel.isValid.bind { [weak self] isValid in
            self?.signUpTextField.isEnabled = isValid
        }
        
        viewModel.errorMessage.bind { [weak self] message in
            self?.errorLabel.text = message
        }
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        recommendationTextField.addTarget(self, action: #selector(recommendationTextFieldChanged), for: .editingChanged)
    }

    @objc func emailTextFieldChanged() {
        viewModel.email.value = emailTextField.text ?? ""
        viewModel.checkValidation()
    }
    
    @objc func passwordTextFieldChanged() {
        viewModel.password.value = passwordTextField.text ?? ""
        viewModel.checkValidation()
    }
    
    @objc func recommendationTextFieldChanged() {
        viewModel.recommendationCode.value = recommendationTextField.text ?? ""
        viewModel.checkValidation()
    }
    
    
    // MARK: - 스냅킷
    func jackConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }
    }
    func emailConstriants() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(200)
            make.leadingMargin.equalTo(view).offset(30)
            make.trailingMargin.equalTo(view).offset(-30)
            make.height.equalTo(40)
        }
    }
    func passwordConstriants() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func nicknameConstriants() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    func locationConstriants() {
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func recommendationConstriants() {
        recommendationTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func signUpConstraints() {
        signUpTextField.snp.makeConstraints { make in
            make.top.equalTo(recommendationTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
        
    }
    func switchButtonConstraints() {
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(signUpTextField.snp.bottom).offset(10)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    func extraLabelConstraints() {
        extraLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.height.equalTo(20)
            
        }
    }
    
    func errorLabelConstraints() {
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpTextField.snp.bottom).offset(70)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(20)
        }
    }
}

