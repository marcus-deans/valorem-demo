//
//  IconListViewModel.swift
//  ValoremAppFull
//
//  Created by Marcus Deans on 8/3/21.
//

import Foundation

struct IconListViewModel{
    var valueCount: Int = 0
    
    // MARK: - Validation Checks
    func checkThreeValues(_field:Int) -> Bool {
        return (_field==3)
    }
    
    var selectionComplete: Bool {
        if checkThreeValues(_field: valueCount){
            return true
        }
        return false
    }
    // MARK: - String Returns
    var validValueCount: String {
        if checkThreeValues(_field: valueCount) {
            return ""
        } else {
            return "Please select 3 values."
        }
    }
}
