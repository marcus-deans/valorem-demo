//
//  FBUser.swift
//  Signin With Apple

//Model for Firebase User
import Foundation
import FirebaseFirestore

//When account created -> capture Firebase info
struct FBUser {
    let uid: String
    let firstName: String
    let lastName: String
    let birthDate: Date
//  let birthDate: Timestamp
    let email: String
    
    // App Specific properties can be added here
    
    init(uid: String, firstName: String, lastName: String, birthDate: Date, email: String) {
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.email = email
    }

}

//Extension that creates dictionary of all keys and values when instance created
extension FBUser {
    init?(documentData: [String : Any]) {
//        let fakeDate = Date()
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let firstName = documentData[FBKeys.User.firstName] as? String ?? ""
        let lastName = documentData[FBKeys.User.lastName] as? String ?? ""
        let birthDate = documentData[FBKeys.User.birthDate] as? Date ?? Date()
//        let birthDateTemp = documentData[FBKeys.User.birthDate] as? Timestamp ?? Timestamp()
        let email = documentData[FBKeys.User.email] as? String ?? ""
        
        // Make sure you also initialize any app specific properties if you have them

//        let birthDate = birthDateTemp.dateValue()
        
        self.init(uid: uid,
                  firstName: firstName,
                  lastName: lastName,
                  birthDate: birthDate,
//                  birthDate: birthDateTemp.
                  email: email
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDict(uid: String, firstName: String, lastName: String, birthDate: Date, email: String) -> [String: Any] {
        var data: [String: Any]
        
        // If name is not "" this must be a new entry so add all first time data
        if (firstName != "" && lastName != ""){
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.firstName: firstName,
                FBKeys.User.lastName: lastName,
                FBKeys.User.birthDate: birthDate,
                FBKeys.User.email: email
                // Again, include any app specific properties that you want stored on creation
            ]
        } else {
            // This is a subsequent entry so only merge uid and email so as not
            // to overrwrite any other data.
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.email: email
            ]
        }
        return data
    }
}
