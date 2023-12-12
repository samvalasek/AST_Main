//
//  RegistrationViewModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var Form = "13SMI"
    
    func createUser() async throws {
       try await AuthenticationService.shared.createUser(email: email, password: password, fullName: fullName, form: Form)
        email = ""
        password = ""
        fullName = ""
        Form = ""
    }
}
