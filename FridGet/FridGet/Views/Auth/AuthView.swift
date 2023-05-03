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
            
            HStack {
                Text(isLogin ? "Welcome back!" : "Create your account")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 4)
            
            HStack {
                Text(isLogin ? "Log in to access your account and stay connected." : "Stay connected with your circle of friends by creating an account now!")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                Spacer()
            }
            .padding(.bottom, 64)
            
            VStack(spacing: 32) {
                if (!isLogin) {
                    TextInputField("Alex Taylor", text: $fullname)
                }

                TextInputField("example@email.com", text: $email)
                
                BorderedSecureInputField("Password", text: $password)
            }
            CustomButton(text: isLogin ? "Log In" : "Create Account", action: {}, isBordered: false)
                .padding(.top, 64)
            
            HStack {
                if (!isLogin) {
                    Text("Have an account?")
                    
                    Button(action: {
                        isLogin = true
                        fullname = ""
                        
                    }) {
                        Text("Log in")
                            .underline()
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.blue)
                    
                } else {
                    Text("Don't have an account?")
                    
                    Button(action: {
                        isLogin = false
                    }) {
                        Text("Create Account")
                            .underline()
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.blue)
                }
            }
            .padding(.top, 12)
            Spacer()
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
