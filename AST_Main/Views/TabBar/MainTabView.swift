//
//  MainTabView.swift
//  AST_Main
//
//  Created by Sam Valasek on 28/11/2023.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    var body: some View {
        TabView {
            HomeView(user: user)
                .tabItem {
                    Image(systemName: "house")
                }
            TrackView(user: user)
                .tabItem { Image(systemName: "plus.square") }
            Text("Profile & Settings")
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
    }
}

#Preview {
    MainTabView(user: User.MOCK_USER)
}
