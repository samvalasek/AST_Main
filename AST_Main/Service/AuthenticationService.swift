//
//  AuthenticationService.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI //Import required to write swift code
import FirebaseAuth //Import required to create a user via FirebaseAuth
import FirebaseFirestoreSwift //Import Required to store data in the user database
import Firebase //Import required to use Firebase

class AuthenticationService {
    /*
     Variables
     */
    @Published var userSession: FirebaseAuth.User? //Firebase's instance of a current user, this is NOT a user object but instead a Firebase user.
    @Published var currentUser: User? //Application's object of a user, which holds all the user metadata locally for the app.
    static let shared = AuthenticationService() //this creates a shared instance of the Authentication service to route all execution through the shared instance. This prevents there being multiple instances of the same code.
    
    /*
     Functions
     */
    
    init() { //init runs on the first instance of this class being called, runs all the code in this block.
        self.userSession = Auth.auth().currentUser //sets the current user to the current user on the backend.
        Task { try await fetchUserData() } //attempts to fetch user data.
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws { //function to login the user to the application
        do { //attempts to run all the code in the "do" block, if any of the code "throws" it will catch and run the catch block
            let result = try await Auth.auth().signIn(withEmail: email, password: password) //attempts to sign the user in, using the information inserted into the fields.
            self.userSession = result.user //sets the current user session Instance to the user pulled from the data base.
            try await fetchUserData() //calls the fetch user data function to fetch the users data
        } catch { //catches any errors in the code block above
            print("!! DEBUG: Failed to sign in user with error \(error.localizedDescription)") //prints appropriate debug message to console
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullName: String, form: String) async throws { //function to create a user
        do { //attempts to run all the code in the "do" block, if any of the code "throws" it will catch and run the catch block
            let result = try await Auth.auth().createUser(withEmail: email, password: password) //attempts to create a user via firebase authentication
            self.userSession = result.user //sets the current user session to the user created in the line above
            print("!! DEBUG: Did create user")
            await uploadUserData(uid: result.user.uid, fullName: fullName, email: email, Form: form) //attempts to create a user object in the firebase database (where user metadata is stored).
            print("!! DEBUG: Did upload user")
        } catch {  print("!! DEBUG: Failed to register user with error \(error.localizedDescription)") /*prints appropriate error message*/ }
    }
    
    @MainActor
    func fetchUserData() async throws {
        do {//attempts to run all the code in the "do" block, if any of the code "throws" it will catch and run the catch block
            guard let currentUid = Auth.auth().currentUser?.uid else { return } //attempts to fetch the ID of the current user from the firebase database
            let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument() //attempts to fetch user data from the firebase database and stores it into a snapshot
            self.currentUser = try? snapshot.data(as: User.self) //sets the current user object in the app. the snapshot pulls encoded data from the firebase database, therefore the (as: User.self) attempts to decode the user data into the user object, as the user object is 'codable'.
        } catch { print("!! DEBUG: Failed to fetch user data with error \(error.localizedDescription)") } //prints appropriate error message if any of the above code runs into an error.
    }
    
    func signOut() { //sign out function
        try? Auth.auth().signOut() //attempts to sign the user out of the backend firebase session.
        self.userSession = nil //sets the current userSession instance to nil
        self.currentUser = nil //sets the current user object as nil.
    }
    
    func deleteAccount() {
        
    }
    
    private func uploadUserData(uid: String, fullName: String, email: String, Form: String) async { //uploads the user database to the firebase database
        let user = User(id: uid, fullName: fullName, email: email, form: Form) //creates a user object to upload
        self.currentUser = user //sets the current application user object to the above user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } //encodes the data so it can be stored in a form that firebase will recognise
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //Attempts to upload the data to the "users" collection with the document id of the current user's ID.
    }
}
