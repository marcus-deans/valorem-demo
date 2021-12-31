//
//  IconList.swift
//  ValoremApp
//
//  Created by Henry  Barklam on 6/8/21.
//

import SwiftUI

struct IconListView: View {
    @EnvironmentObject var userInfo: UserInfo
    //@State var valueCount = 0
    @State var valueList: IconListViewModel = IconListViewModel() //handle verification
//    @ObservedObject var iconListVM = FactorListViewModel()

    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell().backgroundColor = .clear
    }
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .top, endPoint: .bottom)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            .overlay(
        NavigationView{
            VStack(alignment: .leading){
                Text("Tell us what matters")
                    .font(.title)
                    .bold()
                    .padding(.trailing, 10)
//                    .padding(.trailing, 30)
//                    .padding(.vertical, -4.0)
                    .frame(width: 288, height: 61, alignment: .center)
//                    .padding(.horizontal, 30)
                    .navigationBarHidden(true)
                Text("Choose your top three")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                List(icons){ icon in
                    IconRowView(icon: icon, valueCount: $valueList.valueCount)

                }
                    .listRowInsets(EdgeInsets())
                
//                self.$valueList.valueCount = valueCount
//                Text("Number of values is: \(self.valueCount)")
                
                if !valueList.checkThreeValues(_field: valueList.valueCount){
                    Text(valueList.validValueCount)
//                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                NavigationLink(destination: PortfolioTargetSelectionView()) {

                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding()
                        //            }
                        .padding(.horizontal, 70)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .border(Color.blue, width: 5)
                        .cornerRadius(18)
                        .padding(.bottom, 0)
                        .padding(.horizontal, 80)
                }.disabled(!valueList.selectionComplete)

                //FIGURE THIS OUT
                //            NavigationView{
                //                Text("Continue")
                //            }
                //            .navigationViewStyle(StackNavigationViewStyle())
                
                
            }
//            .navigationBarTitle("Tell us what matters")
            .environment(\.defaultMinListRowHeight, 10)
//            .padding()
            .padding(.top,5)
            .padding(.bottom,5)
            //Change this to make it aesthetic
//            .navigationBarHidden(true)
            //        )
        }

    }
}

struct IconList_Previews: PreviewProvider {
    static var previews: some View {
        IconListView()
    }
}
