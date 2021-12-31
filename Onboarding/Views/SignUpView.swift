//
//  SignUpView.swift
//  Signin With Apple
//
//  Created by Marcus Deans on 6/28/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo //storing user info and authentication state
    @State var user: UserViewModel = UserViewModel() //do verifications
    @Environment(\.presentationMode) var presentationMode //so dismiss button dismisses popup
    @State private var showError = false
    @State private var errorString = "" //localized text for error
    
    var closedRange: ClosedRange<Date>{
        let eighteenYears = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        let hundredYears = Calendar.current.date(byAdding: .year, value: -100, to: Date())!

        return hundredYears...eighteenYears
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    VStack(alignment: .leading) {
                        TextField("First Name", text: self.$user.firstName).autocapitalization(.words)
                        if !user.validFirstNameText.isEmpty {
                            Text(user.validFirstNameText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField("Last Name", text: self.$user.lastName).autocapitalization(.words)
                        if !user.validLastNameText.isEmpty {
                            Text(user.validLastNameText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        DatePicker("Date of Birth", selection: self.$user.birthDate, in: closedRange, displayedComponents: .date)
                    }
                    VStack(alignment: .leading) {
                        TextField("Email Address", text: self.$user.email).autocapitalization(.none).keyboardType(.emailAddress)
                        if !user.validEmailAddressText.isEmpty {
                            Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Password", text: self.$user.password)
                        if !user.validPasswordText.isEmpty {
                            Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Confirm Password", text: self.$user.confirmPassword)
                        if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                            Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                }.frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                VStack(spacing: 20 ) {
                    Button(action: {
                        FBAuth.createUser(withEmail: self.user.email, firstName: self.user.firstName, lastName: self.user.lastName, birthDate: self.user.birthDate, password: self.user.password) { (result) in
                            switch result {
                            case .failure(let error):
                                self.errorString = error.localizedDescription
                                self.showError = true ///use to trigger alert
                            case .success( _): //always true if success
                                print("Account Creation successful")
                                //triggers state change -> calls configuration FBstateDidChange holder
                            //updates userInfo environment object -> updates parent view of SignUp to require refresh
                            }
                        }
                        
                    }) {
                        Text("Sign Up")
                            .frame(width: 200)
                            .padding(.vertical, 15)
                            .background(Color.blue)
                            .cornerRadius(18)
                            .foregroundColor(.white)
                            .opacity(user.isSignInComplete ? 1 : 0.75)
                    }
                    .disabled(!user.isSignInComplete)
                    Spacer()
                }.padding()
            }.padding(.top)
            .alert(isPresented: $showError, content: {
                Alert(title: Text("Error creating account"), message: Text(self.errorString), dismissButton: .default(Text("OK")))
            })
                .navigationBarTitle("Sign Up", displayMode: .inline)
                .navigationBarItems(trailing: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

