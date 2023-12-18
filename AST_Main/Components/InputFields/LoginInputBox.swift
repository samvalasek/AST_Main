//
//  LoginInputBox.swift
//  AshfieldStudyTracker
//
//  Created by Sam Valasek on 14/11/2023.
//

import SwiftUI

struct LoginInputBox: View {
    /*
     Variables
     */
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    /*
     View
     */
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .textInputAutocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .textInputAutocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            
                
        }
    }
}

#Preview {
    LoginInputBox(text: .constant(""), title: "Email", placeholder: "name@ast.com")
}
