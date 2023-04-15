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
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                
                if (!isLogin) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Full Name", text: $fullname)
                            .textInputAutocapitalization(.never)
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 0.5)))
                }
            }
            
            Spacer()
            
            Button("\(isLogin ? "Login" : "Register")") {
                print(isLogin ? "Login Button Clicker" : "Register Button Clicked")
            }
            .buttonStyle(.bordered)
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            HStack {
                if (!isLogin) {
                    Text("Have an account?")
                    
                    Button("Login") {
                        isLogin = true
                    }.buttonStyle(.borderless)
                } else {
                    Text("Don't have an account?")
                    
                    Button("Register") {
                        isLogin = false
                    }.buttonStyle(.borderless)
                }
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
