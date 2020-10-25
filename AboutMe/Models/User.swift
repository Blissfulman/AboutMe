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
    let password: String
}

extension User {
    static func getAutorizationData() -> (name: String, surname: String, password: String) {
        return ("Evgeny", "Novgorodov", "Go!")
    }
    
    static func getNamesOfPhotos() -> [String] {
        return ["image-1", "image-2", "image-3", "image-4",
                "image-5", "image-6", "image-7", "image-8"]
    }
}
