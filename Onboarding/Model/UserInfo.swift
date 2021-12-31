//
//  UserInfo.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/27/21.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject{
    enum FBAuthState {
        case undefined, signedOut, signedIn
    }
    
    @Published var isUserAuthenticated: FBAuthState = .undefined
//    let falseDate = Date()
    @Published var user: FBUser = .init(uid: "", firstName: "", lastName: "", birthDate: Date(), email: "")
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    func configureFirebaseStateDidChange(){
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_, user) in
            guard user != nil else {
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .signedIn
//            FBFirestore.retrieveFBUser(uid: user.uid){ (result) in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
    }
}
