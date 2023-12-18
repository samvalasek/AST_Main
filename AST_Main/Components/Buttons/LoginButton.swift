//
//  LoginButton.swift
//  AST_Main
//
//  Created by Sam Valasek on 23/11/2023.
//

import SwiftUI
import SwiftUI

struct LoginButton: View {
    var text: String
    var foregroundColor: Color
    var backgroundColor: Color
    var body: some View {
            Text(text)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10)
            .padding(.vertical)
    }
}

#Preview {
    LoginButton(text: "SIGN IN", foregroundColor: .white, backgroundColor: Color(.systemBlue))
}
