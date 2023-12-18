//
//  RegistrationPicker.swift
//  AST_Main
//
//  Created by Sam Valasek on 30/11/2023.
//

import SwiftUI

struct RegistrationPicker: View {
    let PickerText: String
    let PickerItems: [String]
    var body: some View {
        HStack {
            Text(PickerText)
            Spacer()
            Picker(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, selection: <#T##Binding<Hashable>#>, content: <#T##() -> View#>)
        }
    }
}

#Preview {
    RegistrationPicker(PickerText: "Veicles", PickerItems: ["Car","Bus","Plane"])
}
