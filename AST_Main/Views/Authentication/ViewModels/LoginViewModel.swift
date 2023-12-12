//
//  LoginViewModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 06/12/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthenticationService.shared.login(withEmail: email, password: password)
        print("LoginViewModel: Function Ran")
    }
}
