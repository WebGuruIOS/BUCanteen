//
//  OrderDetailsModel.swift
//  BUCanteen
//
//  Created by Prince on 25/11/24.
//

import Foundation

struct OrderDetailsModel:Codable{
   let responseCode : Int
    let responseText : String
    let responseData:OrderDetailsData?
}

struct OrderDetailsData:Codable{
    let id : String
    let isCancellable:Bool
    let order_id : String
    let user_id : String
    let user_type : String
    let order_type : String
    let order_total : String
    let coupon_code : String
    let discount_amount : String
    let delivery_amount : String
    let payment_mode : String
    let total_tax_amount : String
    let order_net_total : String
    let delivery_user_name : String
    let delivery_phone_number : String
    let delivery_address : String
    let delivery_block : String
    let delivery_floor : String
    let delivery_room_no : String
    let payment_id : String
    let payment_status : String
    let status : String
    let payment_date : String
    let created_at : String
  //  let updated_at : String
    let order_for : String
    let delivery_time : String
    let delivery_department : String
    let delivery_building : String
    let order_otp : String
    let orderitem:[orderitemData]
    
}
struct orderitemData:Codable{
    let id: Int
    let manage_orders_id: Int
    let fooditem_id: Int
    let image: String
    let quantity: Int
    let fooditem_name: String
    let fooditem_description: String
    let purchase_amount: String
    let actual_amount: String
    let created_at: String
    let updated_at: String
    let menu_item_id: Int
}

