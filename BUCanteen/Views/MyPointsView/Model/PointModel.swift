//
//  PointModel.swift
//  BUCanteen
//
//  Created by Prince on 12/11/24.
//

import Foundation

struct PointModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:pointData?
}

struct pointData:Codable{
    var data:[pointAllData]?
    var cureentPage : String?
    var totalPage : String?
}

struct pointAllData:Codable, Identifiable{
    var id : String?
    var user_id : String?
    var previous_amount : String?
    var transaction_type : String?
    var transaction_amount : String?
    var balance_amount : String?
    var transaction_comment : String?
    var created_at : String?
    var updated_at : String?
    var transaction_id : String?
}
