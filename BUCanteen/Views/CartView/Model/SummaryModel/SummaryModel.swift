//
//  SummaryModel.swift
//  BUCanteen
//
//  Created by Prince on 19/11/24.
//

import Foundation

struct SummaryCartModel:Codable{
    let responseCode:Int?
    let responseText:String?
    let responseData:SummaryCartData?
}

struct SummaryCartData:Codable{
    let cart_items :[summaryCart_items]?
    let cart_total : String?
    let discount : String?
    let discountcode : String?
    let minimumOrderAmount : String?
    let order_total : String?
}

struct summaryCart_items:Codable{
    let id : Int?
    let user_id : Int?
    let item_availability_id : Int?
    let item_id : Int?
    let quantity : Int?
    let user_ip : String?
    let session_id : String?
    let created_at : String?
    let updated_at : String?
    let price :String?
    let total : Int?
    let product_id : Int?
    let orderFor : String?
    let description : String?
    let name : String?
    let image : String?
}


/*
 {
     "responseStatus": 1,
     "responseText": "All cart items",
     "responseData": {
         "cart_items": [
             {
                 "id": 5272,
                 "user_id": 27,
                 "item_availability_id": 7734,
                 "item_id": 18,
                 "quantity": 1,
                 "user_ip": "14.102.68.239",
                 "session_id": "j7BroDlIP9mrNfP09uphAwKtHQRGiuBDpBK6gK2O",
                 "created_at": "2024-12-11T02:57:27.000000Z",
                 "updated_at": "",
                 "price": "45.00",
                 "total": 45,
                 "product_id": 18,
                 "orderFor": "lunch",
                 "description": "<p>Rice, Dal, Vaja, Sabji</p>",
                 "name": "Veg Thali",
                 "image": "admin/uploads/images/food/food-item-image-1706419251.jpeg"
             },
             {
                 "id": 5273,
                 "user_id": 27,
                 "item_availability_id": 7731,
                 "item_id": 19,
                 "quantity": 1,
                 "user_ip": "14.102.68.239",
                 "session_id": "0LSNPUYDNvaja4lfRGspewFOTMpr7t6xOIqtcgYl",
                 "created_at": "2024-12-11T02:57:29.000000Z",
                 "updated_at": "",
                 "price": "60.00",
                 "total": 60,
                 "product_id": 19,
                 "orderFor": "lunch",
                 "description": "<p>Rice, Dal, Vaja, Sabji, Egg Curry</p>",
                 "name": "Egg Thali",
                 "image": "admin/uploads/images/food/food-item-image-1706419348.jpeg"
             }
         ],
         "cart_total": "105.00",
         "discount": "0.00",
         "discountcode": "",
         "minimumOrderAmount": "0",
         "order_total": "105.00"
     }
 }
 */
