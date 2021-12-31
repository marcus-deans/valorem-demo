//
//  PortfolioPage.swift
//  ValoremAppFull
//
//  Created by Henry  Barklam on 6/11/21.
//

import SwiftUI

struct PortfolioTargetSelectionView: View {
    @State var targetSelect: PortfolioTargetSelectionViewModel = PortfolioTargetSelectionViewModel() //handle verification
    
    var body: some View {
        VStack(alignment:.center) {
            Text("Select your journey")
                .font(.title)
                .bold()
                .padding(.leading, 20)
                .padding(.vertical, 70)
            
//            VStack {
//                Text("Consistent Risk")
//                    .fontWeight(.medium)
//                .padding()
//
//                HStack {
//                    riskSlider(riskValue: $targetSelect.riskValue)
//
//                }
//                .padding()
//            }
            VStack {
                Text("Choose your risk/impact preference")
                    .fontWeight(.medium)

                VStack {
                    impactSlider(impactValue: $targetSelect.impactValue)
                }
                .padding(.vertical, 50)
                .padding()
                
                NavigationLink(destination: PortfolioLoadingPage()) {
                    Text("Continue")
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal, 70)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .border(Color.blue, width: 5)
                        .cornerRadius(18)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct PortfolioPage_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioTargetSelectionView()
    }
}

//struct riskSlider: View {
//    @Binding var riskValue: Double
//
//    var body: some View {
//        Image(systemName: "minus")
//        Slider(value: $riskValue, in: -100.0...100.0)
//
//            .accentColor(Color.pink)
//
//
//
//        Image(systemName: "plus")
//
//    }
//}


struct impactSlider: View {
    @Binding var impactValue: Double
    @State var isEditing = false
    
    var body: some View {
        Slider(
            value: $impactValue,
            in: -1...1,
            step: 1,
            onEditingChanged: { editing in
                isEditing = editing
            },
            minimumValueLabel: Image(systemName: "minus"),
            maximumValueLabel: Image(systemName: "plus")
        ){
            Text("Impact")
        }
//        Text("\(impactValue, specifier: "%.0f")")
//            .foregroundColor(isEditing ? .purple : .blue)
        switch impactValue{
        case 0.0:
            Text("Standard Impact | Standard Returns")
            .foregroundColor(isEditing ? .purple : .blue)
        case 1.0:
            Text("Higher Impact | Lower Returns")
            .foregroundColor(isEditing ? .purple : .blue)
        case -1.0:
            Text("Lower Impact | Higher Returns")
            .foregroundColor(isEditing ? .purple : .blue)
        default :
            Text("This should not occur.")
        }
    }
}
