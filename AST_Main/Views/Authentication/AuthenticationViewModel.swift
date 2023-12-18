//
//  AuthenticationViewModel.swift
//  AST_Main
//
//  Created by Sam Valasek on 25/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
@MainActor //Publishes the asynchronous code back onto the main thread, as asynchronous code is ran on a backround thread.
class AuthenticationViewModel: ObservableObject {
    /*
     Variables
     */
    @Published var userSession: FirebaseAuth.User? //firebase auth user
    @Published var currentUser: User? //local user model (containing metadata)
    
    /*
     Functions
     */
    init() {
        Task {
            await getUserData()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await getUserData()
        } catch {
            print("DEBUG: Failed to log in \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do { //the do block attempts to run all the 
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await getUserData()
        } catch {
            print("DEBUG: Failed to create user, \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out, \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func getUserData() async {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
