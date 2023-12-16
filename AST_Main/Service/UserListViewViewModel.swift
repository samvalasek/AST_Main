//
//  UserListViewViewModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 12/12/2023.
//

import Foundation
 
class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    func fetchAllUsers() async throws {
        self.users = try await UserService.getAllUsers()
    }
}
