//
//  timeSlotModel.swift
//  BUCanteen
//
//  Created by Prince on 10/12/24.
//

import Foundation

struct timeSlotData:Codable {
     let responseText : String
     let responseCode : Int
     let responseData: [timeSlotDataList]
}

struct timeSlotDataList:Codable {
    let timeSlot : String
    let id : Int
    let type : String
}
