//
//  TrackView.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI

struct TrackView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(alignment: .leading)
            {
                UsernameBar(user: user)
                
                HStack() {
                    Text("Track Your Studying")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                    .padding(16)
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 72)
                    .background(Color(.systemBlue).gradient)
                    .cornerRadius(10)
                    .padding()
                
                Text("Recent Studying: ")
                    .padding(.horizontal)
                    .font(.title2)
                    .fontWeight(.semibold)
                ForEach(TrackedStudy.MOCK_STUDY) { study in
                    TrackedStudyItem(subject: study.subject, date: "01/12/2023", description: study.Description, timeperiod: "20 minutes")
                }
                .padding(.horizontal)
                
                if TrackedStudy.MOCK_STUDY.isEmpty {
                    VStack {
                        Text("No Recent Studying")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top)
                        Text("Why not get started by tracking your first study session? Just click 'Track Your Studying' above.")
                            .modifier(DescriptorModifier())
                    }
                }
            }
        }
    }
}

#Preview {
    TrackView(user: User.MOCK_USERS[0])
}
