//
//  SimpleCollectionViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/18.
//

import Foundation

class SimpleCollectionViewModel {
    let list: Observable<[User]> = Observable([])
    
    let list2: Array<User> = [
        User(name: "파이리", age: 23),
        User(name: "꼬부기", age: 23),
        User(name: "야도란", age: 21),
        User(name: "피카츄", age: 20),
        User(name: "리자몽", age: 20),
    ]
    
    func append() {
        list.value = [
            User(name: "Hue", age: 23),
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 20),
            User(name: "kokojong", age: 20),
        ]
    }
    
    func remove() {
        list.value = []
    }
    
    func removeUser(idx: Int) {
        list.value.remove(at: idx)
    }
    
    func insertUser(name: String) {
        let user = User(name: name, age: Int.random(in: 10...70))
        list.value.insert(user, at: Int.random(in: 0...2))
    }
}
