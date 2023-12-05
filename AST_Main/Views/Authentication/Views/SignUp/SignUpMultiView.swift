//
//  SignUpMultiView.swift
//  AST_Main
//
//  Created by Sam Valasek on 23/11/2023.
//

import SwiftUI

struct SignUpMultiView: View {
    /*
     Variables
     */
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss
    /*
     View
     */
    var body: some View {
        VStack {
            ASTBar()
            Image("ASTLogoWhiteRounded")
                .resizable()
                .frame(width: 120, height: 120)
                .shadow(radius: 10)
                .padding(.top, 35)
            VStack(spacing: 24) {
                LoginInputBox(text: $fullName, title: "Full Name", placeholder: "John Doe")
                LoginInputBox(text: $email, title: "Email", placeholder: "hello@username.com")
                LoginInputBox(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                ZStack(alignment: .trailing) {
                    LoginInputBox(text: $confirmPassword, title: "Confirm Password", placeholder: "Re-enter your password", isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
            }
            .padding()
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, 
                                                   password: password, 
                                                   fullName: fullName)
                }
            } label: {
                LoginButton(text: "SIGN UP", foregroundColor: .white, backgroundColor: .blue)
            }

            Spacer()
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
            }
            Text("Ashfield Study Tracker, v1 by Sam Valasek")
                    .foregroundStyle(Color(.darkGray))
                    .font(.footnote)
                    .padding(.vertical, 2)
        }
    }
}

#Preview {
    SignUpMultiView()
}
