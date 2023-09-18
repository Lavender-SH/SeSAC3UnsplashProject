//
//  CalculateViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    
    var firstNumber: CustomObservable<String?> = CustomObservable("10")
    var secondNumber: CustomObservable<String?> = CustomObservable("20")
    var resultText = CustomObservable("결과는 30")
    var tempText = CustomObservable("테스트를 위한 텍스트임!")
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
    func presentNumberFormat() {
        guard let firstNumber = firstNumber.value, let firstConvertNumber = Int(firstNumber) else {
            resultText.value = "숫자로 변환할 수 없는 문자입니다."
            return
        }
        
        tempText.value = format(for: firstConvertNumber)
    }
    
    func calculate() {
        guard let firstNumber = firstNumber.value, let firstConvertNumber = Int(firstNumber) else {
            resultText.value = "첫번째 값에서 오류가 발생했습니다."
            return
        }
        
        guard let secondNumber = secondNumber.value, let secondConvertNumber = Int(secondNumber) else {
            resultText.value = "두번째 값에서 오류가 발생했습니다."
            return
        }
        
        resultText.value = "결과는 \(firstConvertNumber + secondConvertNumber)입니다."
    }
}