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
    
    @State var errorsList: [String] = []
    @State var isButtonDisabled: Bool = true
    
    var wrongPasswordLogin: Bool = true
    
    func authValidation() {
        if (email != "" && !isValidEmail(email: email)) {
            errorsList.append("Email format is invalid")
        }
        
        if (isLogin) {
            if (wrongPasswordLogin) {
                errorsList.append("Incorrect email or password")
            }
            
            if (email == "" || password == "") {
                errorsList.append("Please fill all fields")
            }
        } else {
            if (!isValidPassword(password: password)) {
                errorsList.append("Password must contain minimum 8 characters at least 1 alphabet and 1 number")
            }
            
            if (email == "" || password == "" || fullname == "") {
                errorsList.append("Please fill all fields")
            }
        }
    }
    
    func isEmptyField() -> Bool {
        if (isLogin) {
            return email == "" || password == ""
        } else {
            return email == "" || password == "" || fullname == ""
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    
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
                    .keyboardType(.emailAddress)
                
                BorderedSecureInputField("Password", text: $password)
            }
            
            ForEach(errorsList, id: \.self) { err in
                
                HStack {
                    Image(systemName: "xmark.circle.fill")
                    
                    Text(err)
                    
                    Spacer()
                }
                .foregroundColor(Color("lightRed"))
                .font(.footnote)
                
            }
            
            CustomButton(text: isLogin ? "Log In" : "Create Account", action: {
                errorsList.removeAll()
                authValidation()
            }, isPrimary: true, isDisabled: isEmptyField())
                .padding(.top, 64)
                .disabled(isEmptyField())
            
            HStack {
                if (!isLogin) {
                    Text("Have an account?")
                    
                    Button(action: {
                        isLogin = true
                        fullname = ""
                        email = ""
                        password = ""
                        errorsList.removeAll()
                        
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
                        fullname = ""
                        email = ""
                        password = ""
                        errorsList.removeAll()
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
