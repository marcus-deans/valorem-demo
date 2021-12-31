//
//  IconList.swift
//  ValoremApp
//
//  Created by Henry  Barklam on 6/8/21.
//

import SwiftUI

struct IconList: View {
    var body: some View {
        
        VStack{
            Text("Tell Us What Matters Most To You")
                .font(.largeTitle)
                .bold()
                .padding()
                
            
            List(icons){ icon in
                IconRow(icon: icon)
            
            }
            .listRowInsets(EdgeInsets())
            Button(action:{
                print("Yes")
            }){
                Text("Continue")
                    .bold()
            }
            .padding(.leading,100)
            .padding(.trailing,100)
            .padding(.top,15)
            .padding(.bottom, 15)
            .foregroundColor(.black)

            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(lineWidth: 1)
                        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/))
            
            
        }    }
}

struct IconList_Previews: PreviewProvider {
    static var previews: some View {
        IconList()
    }
}
