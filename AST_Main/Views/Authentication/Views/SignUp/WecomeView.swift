//
//  WecomeView.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI
import ConfettiSwiftUI
struct WecomeView: View {
    @State private var confetti: Int = 199
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
       
        Text("Welcome to AST,\n\(viewModel.fullName)")
            .multilineTextAlignment(.center)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    confetti += 1
                }
            }
            .confettiCannon(counter: $confetti)
        Text("Click below to finish registration and start using Ashfield Study Tracker.")
            .modifier(DescriptorModifier())
        Button {
            Task {
                try await viewModel.createUser()
            }
        } label: {
            LoginButton(text: "Complete Registration", foregroundColor: .white, backgroundColor: .blue)
        }
        
    }
}

#Preview {
    WecomeView()
}
