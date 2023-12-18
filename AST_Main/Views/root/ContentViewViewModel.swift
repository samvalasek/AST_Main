//
//  ContentViewViewModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import Foundation
import Firebase
import Combine

class ContentViewViewModel: ObservableObject {
    private let service = AuthenticationService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init () {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
