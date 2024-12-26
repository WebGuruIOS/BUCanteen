//
//  BuildingModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation

struct BuildingModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:[BuildingResponseData]?
}

struct BuildingResponseData:Codable{
    var id:Int?
    var building_name:String?
    var status:String?
    var created_at:String?
   // var updated_at: NULL?
}




 
