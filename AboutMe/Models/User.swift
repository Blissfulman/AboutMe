//
//  User.swift
//  AboutMe
//
//  Created by User on 23.10.2020.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let surname: String
    let password: String
    let namesOfPhotos: [String]
}

extension User {
    static func getUser() -> User {
        return User(
            name: "Evgeny",
            surname: "Novgorodov",
            password: "Go!",
            namesOfPhotos: ["image-1", "image-2", "image-3", "image-4",
                            "image-5", "image-6", "image-7", "image-8"])
    }
}
