//
//  UserDetailView.swift
//  AST_Main
//
//  Created by Sam Valasek on 12/12/2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        Text(user.fullName)
    }
}

#Preview {
    UserDetailView(user: User.MOCK_USERS[0])
}
