//
//  AddEmailView.swift
//  AST_Main
//
//  Created by Sam Valasek on 28/11/2023.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll need to use this email to sign in to your account")
                .modifier(DescriptorModifier())
            TextField("Email", text: $email)
                .textInputAutocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            NavigationLink {
                AddPasswordView()
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
    AddEmailView()
}
