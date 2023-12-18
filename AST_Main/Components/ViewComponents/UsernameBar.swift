//
//  UsernameBar.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI

struct UsernameBar: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            Text("SV")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 52, height: 52)
                .background(Color(.systemGray3))
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.fullName)
                    .fontWeight(.semibold)
                Text(user.email)
                    .font(.caption)
                    .tint(.gray)
            }
            Spacer()
            Button {
                AuthenticationService.shared.signOut()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .foregroundStyle(.red)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

#Preview {
    UsernameBar(user: User.MOCK_USERS[0])
}
