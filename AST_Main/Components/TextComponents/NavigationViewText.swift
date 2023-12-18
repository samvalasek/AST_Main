//
//  NavigationViewText.swift
//  AST_Main
//
//  Created by Sam Valasek on 25/11/2023.
//

import SwiftUI

struct NavigationViewText: View {
    /*
     Variables
     */
    var systemImage: String
    let title: String
    let tintColor: Color
    
    /*
     View
     */
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    NavigationViewText(systemImage: "gear", title: "version", tintColor: Color(.systemGray))
}
