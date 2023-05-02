//
//  ProfileView.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI

struct ProfileView: View {
    @State var isShowChangeNameModal: Bool = false
    @State var isShowBondingPointsModal: Bool = false
    @State var isShowChangePasswordModal: Bool = false
    @State var isShowDeleteAccountAlert: Bool = false
    @State var isShowLogOutAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                InitialAvatar(initial: "AP", fontSize: 24)
                
                VStack(alignment: .leading) {
                    Text("Andini Putri")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(verbatim: "andini@email.com")
                        .font(.footnote)
                        .foregroundColor(Color("tertiaryGray"))
                }
                .padding(.leading, 12)
                
                Spacer()
                
                Image(systemName: "square.and.pencil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        isShowChangeNameModal.toggle()
                    }
                    .sheet(isPresented: $isShowChangeNameModal) {
                        NavigationView {
                            ChangeNameModal()
                        }
                    }
            }
            .padding()
            
            Text("Account")
                .font(.callout)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            VStack {
                TableView(iconName: "sparkles", text: "Bonding Points")
                    .onTapGesture {
                        isShowBondingPointsModal.toggle()
                    }
                    .sheet(isPresented: $isShowBondingPointsModal) {
                        NavigationView {
                            BondingPointsModal()
                        }
                    }
                
                Divider()
                    .padding(.leading, 72)
                
                TableView(iconName: "lock", text: "Change Password")
                    .onTapGesture {
                        isShowChangePasswordModal.toggle()
                    }
                    .sheet(isPresented: $isShowChangePasswordModal) {
                        NavigationView {
                            ChangePasswordModal()
                        }
                    }
                
                Divider()
                    .padding(.leading, 72)
                
                TableView(iconName: "trash", text: "Delete Account")
                
                Divider()
                    .padding(.leading, 72)
                
                HStack {
                    Text("Log Out")
                        .foregroundColor(Color("lightRed"))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("secondaryGray"))
                }
                .padding(.horizontal)
                .padding(.top, 6)
                
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Profile")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
