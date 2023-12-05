//
//  AddPasswordView.swift
//  AST_Main
//
//  Created by Sam Valasek on 29/11/2023.
//

import SwiftUI

struct AddPasswordView: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12) {
            Text("Choose a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Choose your own unique password, you'll need this to log in. It must contain at least 6 characters.")
                .modifier(DescriptorModifier())
            TextField("Enter your password", text: $password)
                .textInputAutocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            TextField("Confirm your password", text: $confirmPassword)
                .textInputAutocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            NavigationLink {
                AddFormView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                LoginButton(text: "Continue", foregroundColor: .white, backgroundColor: Color(.systemBlue))
                    
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    AddPasswordView()
}
