//
//  LoginMultiViewQR.swift
//  AST_Main
//
//  Created by Sam Valasek on 28/11/2023.
//

import SwiftUI

struct LoginMultiViewQR: View {
    /*
     Variables
     */
    @StateObject var viewModel = LoginViewModel()
    
    /*
     Body
     */
    var body: some View {
        NavigationStack {//navigationstacks allow for child views to be "stacked" on top of one another.
            VStack {
                Spacer()
                Image("ASTLogoWhiteRounded")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                //text fields
                VStack {
                    LoginInputBox(text: $viewModel.email, title: "Email", placeholder: "hello@ashfield.com")
                    LoginInputBox(text: $viewModel.password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal, 24)
                
                Button {
                    //forget password function
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                Button {
                    Task {
                        try await viewModel.signIn()
                    }
                } label: {
                    LoginButton(text: "Log In", foregroundColor: .white, backgroundColor: .blue)
                }
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        .foregroundStyle(.gray)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        .foregroundStyle(.gray)
                }
                
                Button {
                    // sign in with qr
                } label: {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color(.black))
                            Image(systemName: "qrcode")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                        Text("Continue with QR Code")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.vertical)
                Spacer()
                NavigationLink {
                    AddNameView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical)
                .foregroundStyle(Color(.systemBlue))
                
                
                
            }
        }
        
    }
}

#Preview {
    LoginMultiViewQR()
}
