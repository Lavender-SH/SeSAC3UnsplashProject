//
//  SampleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/12.
//

import Foundation
// 뷰에 보여줄 데이터를 최대한 가공해는 곳으로 만듦
class SampleViewModel {
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "kokojong", age: 20),
    ]
    var numberOfRowsInSection: Int {
        return list.count
    }
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
