//
//  AdminTabView.swift
//  AST_Main
//
//  Created by Sam Valasek on 11/12/2023.
//

import SwiftUI

struct AdminTabView: View {
    let user: User
    var body: some View {
        TabView {
            Text("View Users")
                .tabItem {
                    Image(systemName: "person")
                }
            Text("View Studying")
                .tabItem { Image(systemName: "book") }
            Text("Manage Data")
                .tabItem {
                    Image(systemName: "gear")
                }
            
        }
        .tint(.red)
    }
}

#Preview {
    AdminTabView(user: User.MOCK_USERS[0])
}
