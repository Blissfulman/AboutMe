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
    static func getAutorizationData() -> (name: String, password: String) {
        return ("1", "1")
    }
}
