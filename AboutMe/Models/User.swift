//
//  User.swift
//  AboutMe
//
//  Created by User on 23.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "Hello",
             password: "Go!",
             person: Person(name: "Evgeny",
                            surname: "Novgorodov",
                            namesOfPhotos: [
                                "image-1", "image-2", "image-3", "image-4",
                                "image-5", "image-6", "image-7", "image-8"
             ]))
    }
}

struct Person {
    let name: String
    let surname: String
    let namesOfPhotos: [String]
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
