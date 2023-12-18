//
//  HomeView.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI

struct HomeView: View {
    let user: User
    var body: some View {
        VStack {
            UsernameBar(user: user)
            BarChart()
            Spacer()
        }
    }
}

#Preview {
    HomeView(user: User.MOCK_USERS[0])
}
