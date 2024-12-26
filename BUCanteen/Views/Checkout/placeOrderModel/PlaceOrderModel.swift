//
//  PlaceOrderModel.swift
//  BUCanteen
//
//  Created by Prince on 11/12/24.
//

import Foundation

struct PlaceOrderModel:Codable {
   var responseText : String
    var responseCode : Int
    var responseData: placeOrderData?
    
}

struct placeOrderData:Codable {
    let orderRowId:String
    let orderId:String
    
}



