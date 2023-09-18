//
//  NumberViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/18.
//

import Foundation

class NumberViewModel {
    
    var number: Observable<String?> = Observable("1000")
    var result = Observable("1,327,000") // resultLabel
    
    func convertNumber() {
        //print(result.value, number.value)
        
        // 빈 값, 문자열, 100만원 내에서(한도)
        guard let text = number.value else {
            result.value = "값을 입력해주세요"
            return
        }
        
        guard let textToNumber = Int(text) else {
            result.value = "100만원 이하의 숫자를 입력해주세요"
            return
        }
        
        guard textToNumber > 0, textToNumber <= 1000000 else {
            result.value = "환전 범주는 100만$ 이하입니다."
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let decimalNumber = numberFormatter.string(for: textToNumber * 1327)!
        
        result.value = "환전 금액은 \(decimalNumber)입니다."
    }
}
