//
//  UserModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 25/11/2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var fullName: String
    let email: String
    var form: String
    let userType: Int
    
    /*
     User Types:
     0 - Student
     1 - Admin
     2 - Developer
     */
    
    
    var initials: String { //returns the users initials that can be used to populate profile icons.
        let formatter = PersonNameComponentsFormatter() //sets the constant 'formatter' to the built in PersonNameComponentsFormatter
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return "AST" //returns a generic string if for whatever reason the formatter fails.
    }
}

extension User {
    static var MOCK_USERS: [User] =
    [.init(id: NSUUID().uuidString, fullName: "Sam Valasek", email: "hello@samvalasek.me", form: "13SMI", userType: 0),
     .init(id: NSUUID().uuidString, fullName: "Sonny Walters", email: "hello@sonnywalters.me", form: "13LOL", userType: 0),
     .init(id: NSUUID().uuidString, fullName: "Dan Vitos", email: "hello@vitos.ml", form: "13HUH", userType: 0)
     ]
}
