//
//  RegistrationModifiers.swift
//  AST_Main
//
//  Created by Sam Valasek on 29/11/2023.
//

import SwiftUI

struct DescriptorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .padding(.bottom)
        
    }
}
