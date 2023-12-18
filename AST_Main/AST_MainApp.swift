//
//  AST_MainApp.swift
//  AST_Main
//
//  Created by Sam Valasek on 23/11/2023.
//

import SwiftUI
import Firebase
@main
struct AST_MainApp: App {
    /*
     Variables
     */
    
    /*
     Functions
     */
    
    init() {
        FirebaseApp.configure()
        AuthenticationService.shared.userSession = nil
    }
    
    /*
     Body
     */
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
