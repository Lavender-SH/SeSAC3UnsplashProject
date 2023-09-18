//
//  Obsevable.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    //나중에 호출될 수 있는 함수
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void ) {
        print(#function)
        closure(value) //콜백함수
        listener = closure
    }
}
