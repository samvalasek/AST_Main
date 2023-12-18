//
//  ContentView.swift
//  AST_Main
//
//  Created by Sam Valasek on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        if viewModel.userSession == nil {
            LoginMultiViewQR()
                .environmentObject(registrationViewModel)
        } else if let currentUser = viewModel.currentUser {
            MainTabView(user: currentUser)
        }
        
    }
}

#Preview {
    ContentView()
}
