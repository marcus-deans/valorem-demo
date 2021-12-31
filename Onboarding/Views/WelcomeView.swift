//
//  HomeView.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 6/27/21.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    @State var firstView = true
    @State var appeared: Double = 0
    @State var gradient = [Color.red, Color.purple, Color.orange]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    //This decides the animation type
    init(){
        UINavigationBar.setAnimationsEnabled(true)
    }
    var body: some View {
        NavigationView {
            LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
            .ignoresSafeArea() // Ignore just for the color
            .onAppear() {
                withAnimation (.easeInOut(duration: 2).repeatForever(autoreverses: true)){
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
            }
            .overlay(
                
                
                VStack {
                    NavigationLink(destination: IconListView()            .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)){
                        
                    Text("\(userInfo.user.firstName) \(userInfo.user.lastName), welcome to Valorem.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(30)
                        .gradientForeground(colors: [.white, .white])
                        .padding(.bottom, 100)
                        .opacity(0.7)
                        .navigationBarTitle("Welcome")
                        .navigationBarItems(trailing: Button("Log Out"){
                            FBAuth.logout{(result) in
                                print("Logged out")
                            }
                        })
                        .onAppear {
                            //check for existence of current user and assigned user's uid to uid constant for func
                            guard let uid = Auth.auth().currentUser?.uid else {
                                return
                            }
                            FBFirestore.retrieveFBUser(uid: uid){ (result) in
                                switch result {
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    //if failure, have error description
                                    //display alert to user (shouldn't happen)
                                case .success(let user):
                                    self.userInfo.user = user
                                }
                            }
                        }

                    }
            
                }
            )
        }
    }
}
            
            
            
//            VStack{
//                Text("Logged in as \(userInfo.user.firstName) \(userInfo.user.lastName)")
//                .navigationBarTitle("Firebase Login")
//                    .navigationBarItems(trailing: Button("Log Out"){
//                        //may want error switch handler
//                        FBAuth.logout { (result) in
//                            print("Logged out")
//                        }
//                    })
//                    .onAppear {
//                        //check for existence of current user and assigned user's uid to uid constant for func
//                        guard let uid = Auth.auth().currentUser?.uid else {
//                            return
//                        }
//                        FBFirestore.retrieveFBUser(uid: uid){ (result) in
//                            switch result {
//                            case .failure(let error):
//                                print(error.localizedDescription)
//                                //if failure, have error description
//                                //display alert to user (shouldn't happen)
//                            case .success(let user):
//                                self.userInfo.user = user
//                            }
//                        }
//                    }
//            }

struct AnimatedGradientView1: View {
    
    @State var gradient = [Color.red, Color.purple, Color.orange]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .frame(width: 256, height: 256)
            .onTapGesture {
                withAnimation (.easeInOut(duration: 3)){
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
