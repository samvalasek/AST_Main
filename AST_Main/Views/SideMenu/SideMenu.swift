//
//  NavigationView.swift
//  AST_Main
//
//  Created by Sam Valasek on 25/11/2023.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(User.MOCK_USER.fullName)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    .padding(.leading, 6)
                }
            }
            
            Section("General") {
                HStack {
                    NavigationViewText(systemImage: "gear",
                                       title: "Version",
                                       tintColor: Color(.systemGray))
                    Spacer()
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            
            Section("Account") {
                Button {
                    //sign user out
                } label: {
                    NavigationViewText(systemImage: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                }
                Button {
                    //delete user
                } label: {
                    NavigationViewText(systemImage: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                }

            }
        }
    }
}

#Preview {
    NavigationView()
}
