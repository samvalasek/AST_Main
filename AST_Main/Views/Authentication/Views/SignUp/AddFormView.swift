//
//  AddFormView.swift
//  AST_Main
//
//  Created by Sam Valasek on 29/11/2023.
//

import SwiftUI

struct Forms: Hashable, Identifiable {
    var id: String {
        return code + tutor
    }
    let code: String
    let tutor: String
}

struct AddFormView: View {
    /*
     Variables
     */
    private var tutors = [
        Forms(code: "13SMI", tutor: "Miss H. Smith"),
        Forms(code: "13HUH", tutor: "Miss X"),
        Forms(code: "13LOL", tutor: "Mr Lol.")
    ]
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    /*
     View
     */
    var body: some View {
        VStack(spacing: 12) {
            Text("Select your Form")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                
                Text("Use the selector to choose your form group.")
                    .modifier(DescriptorModifier())
            Picker("Form", selection: $viewModel.Form) {
                ForEach(tutors, id: \.code) {
                    Text("\($0.code) (\($0.tutor))")
                }
            }
            .pickerStyle(.wheel)
                NavigationLink {
                    WecomeView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    LoginButton(text: "Continue", foregroundColor: .white, backgroundColor: Color(.systemBlue))
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }

#Preview {
    AddFormView()
}
