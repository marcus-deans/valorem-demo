//
//  Icon.swift
//  WeSplit
//
//  Created by Henry  Barklam on 6/8/21.
//

import Foundation
import SwiftUI

struct Icon: Hashable, Codable , Identifiable{
    var id : Int
    var name : String
    var isToggled : Bool
    var subname: String
    
    private var imageName: String
    var image : Image{
        Image(imageName)
    }
    var iconimageunchecked: String
    var iconimagechecked: String
    

}
