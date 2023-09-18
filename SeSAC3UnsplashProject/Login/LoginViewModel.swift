//
//  LoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var id = Observable("아이디를 입력해주세요")
    var pw = Observable("비번를 입력해주세요")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completionHandler: @escaping () -> Void) {
        //서버, 닉네임, id, nickname
        UserDefaults.standard.set(id.value, forKey: "id")
        
        completionHandler()
    }
}

