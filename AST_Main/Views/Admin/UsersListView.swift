//
//  UsersListView.swift
//  AST_Main
//
//  Created by Sam Valasek on 11/12/2023.
//

import SwiftUI

struct UsersListView: View {
    @State private var searchField = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                    LazyVStack(spacing:12) {
                        ForEach(viewModel.users) { user in
                            NavigationLink(value: user) {
                                HStack {
                                    Text(user.initials)
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                            .frame(width: 40, height: 40)
                                            .background(Color(.systemGray3))
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                    Text(user.fullName)
                                        .fontWeight(.semibold)
                                    Text(user.form)
                                }
                                    .font(.footnote)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .foregroundStyle(.black)
                            }
                            }
                        }
            }
            .padding(.top, 8)
            .searchable(text: $searchField, prompt: "Search for a User")
        }
        .navigationDestination(for: User.self, destination:  { user in
            UserDetailView(user: user)
        })
        .navigationTitle("Search Users")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    UsersListView()
}
