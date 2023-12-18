//
//  TrackedStudyItem.swift
//  AST_Main
//
//  Created by Sam Valasek on 03/12/2023.
//

import SwiftUI

struct TrackedStudyItem: View {
    /*
     Variables
     */
    var subject: String
    var date: String
    var description: String
    var timeperiod: String
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text(subject)
                    .fontWeight(.semibold)
                Text(date)
                    .font(.caption)
            }
            Divider()
                .tint(.white)
                .padding(.horizontal)
            VStack(alignment: .leading) {
                Text(description)
                    .fontWeight(.semibold)
                Text(timeperiod)
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .foregroundStyle(.white)
        .frame(width: UIScreen.main.bounds.width - 32, height: 72)
        .background(Color(.systemPurple).gradient)
        .cornerRadius(10)
    }
}

#Preview {
    TrackedStudyItem(subject: "Computer Science", date: "01/04/2023", description: "Topic 2 Revision", timeperiod: "60 minutes")
}
