//
//  AddGuestModal.swift
//  FridGet
//
//  Created by Haikal Lazuardi on 03/05/23.
//

import SwiftUI
import WrapLayout

struct AddGuestModal: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var emails: [String]
    @State var email: String = ""
    @State var tags: [String]
    
    var currentEmail = "haikal@email.com"

    let screenWidth = UIScreen.main.bounds.width
    
    init(eventGuests: Binding<[String]>) {
        self._tags = State(initialValue: eventGuests.wrappedValue)
        self._emails = eventGuests
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("To:")
                        .foregroundColor(Color("secondaryGray"))
                    
                    TextField("", text: $email)
                        .multilineTextAlignment(.leading)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .onSubmit {
                            if (isValidEmail(email: email) && email != currentEmail) {
                                print("Email is valid")
                                if (!tags.contains(email)) {
                                  tags.append(email)
                                }
                            } else {
                                print("Email is not valid")
                            }
                        }
                }
                .font(.system(size: 13))
                
                
                Divider()
                    .frame(height: 1)
            }
            
            Group {
                Text("The invitation ")
                + Text("can’t be sent")
                    .fontWeight(.medium)
                + Text(" if the email is not a registered account of Hangoutla.")
            }
            .font(.system(size: 12))
            .foregroundColor(Color("secondaryGray"))
            .multilineTextAlignment(.leading)
            
            WrapLayout {
                ForEach(tags, id: \.self) { tag in
                    EmailTag(email: tag, action: {
                        if let index = tags.firstIndex(of: tag) {
                            tags.remove(at: index)
                        }
                    })
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Cancel")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Add Guests")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Done")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        emails = tags
                        dismiss()
                    }
            }
        }
    }
}

struct AddGuestModal_Previews: PreviewProvider {
    static var previews: some View {
        AddGuestModal(eventGuests: .constant(["hga"]))
    }
}
