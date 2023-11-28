//
//  ASTBar.swift
//  AshfieldStudyTracker
//
//  Created by Sam Valasek on 15/11/2023.
//

import SwiftUI

struct ASTBar: View {
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 221/255, green: 55/255, blue: 49/255), .blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                    .frame(height: 80)
                HStack {
                    Image("ASTLogoWhiteRounded")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                        .frame(width: 25)
                    Text("Ashfield Study Tracker")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}

#Preview {
    ASTBar()
}
