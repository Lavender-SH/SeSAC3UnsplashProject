//
//  String+Extension.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/11.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(number: Int) -> String {
        return String(format: self.localized, number)
    }
    
}
