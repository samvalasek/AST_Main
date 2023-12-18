//
//  UserService.swift
//  AST_Main
//
//  Created by Sam Valasek on 12/12/2023.
//

//   /*
//   Imports
//    */

import Foundation
import Firebase

struct UserService {
    /*
     Variables
     */
    
    /*
     Functions
     */
    
    static func getAllUsers() async throws -> [User] {
        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let user = try? doc.data(as: User.self) else { return users }
            users.append(user)
        }
        return users 
    }
}
