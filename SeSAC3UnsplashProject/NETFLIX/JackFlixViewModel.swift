//
//  JackFlixViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/18.
//
import Foundation

class JackFlixViewModel {
    
    var email = Observable<String>("")
    var password = Observable<String>("")
    var recommendationCode = Observable<String>("")
    var isValid = Observable<Bool>(false)
    var errorMessage = Observable<String>("")
    
    func checkValidation() {
        if !email.value.contains("@") {
            errorMessage.value = "이메일에 @를 포함해주세요."
            isValid.value = false
            return
        }
        
        if recommendationCode.value.count != 6 {
            errorMessage.value = "추천코드는 숫자 6자리여야 합니다."
            isValid.value = false
            return
        }
        
        if password.value.count < 6 || password.value.count > 10 {
            errorMessage.value = "비밀번호는 6~10자리여야 합니다."
            isValid.value = false
            return
        }
        
        errorMessage.value = ""
        isValid.value = true
    }
}
