//
//  AuthView.swift
//  FridGet
//
//  Created by Haikal Lazuardi Fadil on 15/04/23.
//

import SwiftUI

struct AuthView: View {
    @State var isLogin: Bool = false
    
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
                    TextField("Alex Taylor", text: $fullname)
                        .disabled(isLogin)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                }
                .opacity(isLogin ? 0 : 1)
                
                
                VStack(spacing: 4) {
                    HStack {
                        Text("Email")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                }
                
                VStack(spacing: 4) {
                    HStack {
                        Text("Password")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    SecureField("\(isLogin ? "Enter" : "Create") a Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                }
                
                Button(action: { print(isLogin ? "Login Button Clicker" : "Register Button Clicked") }) {
                    Text(isLogin ? "Log In" : "Create Account")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        
                }
                .background(.purple)
                .cornerRadius(10)
                
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
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
