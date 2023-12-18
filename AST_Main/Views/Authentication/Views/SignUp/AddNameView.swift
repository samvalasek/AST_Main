//
//  AddNameView.swift
//  AST_Main
//
//  Created by Sam Valasek on 29/11/2023.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Enter your name")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll need to use your full name, so we can recognise you.")
                .modifier(DescriptorModifier())
            TextField("Enter your name", text: $viewModel.fullName)
                .textInputAutocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
            NavigationLink {
                AddEmailView()
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
    AddNameView()
}
