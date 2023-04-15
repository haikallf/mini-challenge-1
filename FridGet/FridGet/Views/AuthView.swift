//
//  AuthView.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 15/04/23.
//

import SwiftUI

struct AuthView: View {
    @Binding var isUserCurrentlyLoggedIn: Bool
    @State var isLogin: Bool
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Rectangle()
                .frame(width: 140, height: 140)
                .foregroundColor(.gray)
                .padding(.bottom, 80)
            
            VStack(spacing: 20) {
                VStack(spacing: 4) {
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    TextInputField("Alex Taylor", text: $fullname)
                        .disabled(isLogin)
                }
                .opacity(isLogin ? 0 : 1)
                
                VStack(spacing: 4) {
                    HStack {
                        Text("Email")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    TextInputField("Enter your email", text: $email)
                }
                
                VStack(spacing: 4) {
                    HStack {
                        Text("Password")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    SecureInputField("\(isLogin ? "Enter" : "Create") a Password", text: $password)
                }
                
                CustomButton(text: isLogin ? "Log In" : "Create Account", action: { print(isLogin ? "Login Button Clicker" : "Register Button Clicked") }, isBordered: false)
                
                HStack {
                    if (!isLogin) {
                        Text("Have an account?")
                        
                        Button("Log In") {
                            isLogin = true
                            fullname = ""
                        }
                        .buttonStyle(.borderless)
                        .foregroundColor(.purple)
                    } else {
                        Text("Don't have an account?")
                        
                        Button("Create an Account") {
                            isLogin = false
                        }
                        .buttonStyle(.borderless)
                        .foregroundColor(.purple)
                    }
                }
                Spacer()
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(isUserCurrentlyLoggedIn: .constant(false), isLogin: false)
    }
}
