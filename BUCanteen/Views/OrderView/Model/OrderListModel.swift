//
//  OrderListModel.swift
//  BUCanteen
//
//  Created by Prince on 15/11/24.
//

import Foundation

struct OrderListModel: Codable {
    let responseCode: Int?
    let responseText: String?
    let responseData: orderResponseData?
}
struct orderResponseData:Codable {
    let data:[orderListData]?
    let cureentPage :String?
    let totalPage :String?
}

struct orderListData:Identifiable,Codable{
    let id : String?
    let order_id :String?
    let user_id : String?
    let user_type : String?
    let order_type : String?
    let order_total :String?
    let coupon_code :String?
    let discount_amount :String?
    let delivery_amount :String?
    let payment_mode :String?
    let total_tax_amount :String?
    let order_net_total :String?
    let delivery_user_name :String?
    let delivery_phone_number : String?
    let delivery_address : String?
    let delivery_block : String?
    let delivery_floor : String?
    let delivery_room_no : String?
    let payment_id : String?
    let payment_status :String?
    let status : String?
    let payment_date : String?
    let created_at : String?
    let updated_at : String?
    let order_for : String?
    let delivery_time : String?
    let delivery_department : String?
    let delivery_building : String?
    let order_otp : String?
}

/*
 "id": "1568",
                 "order_id": "BWUPP173157863635",
                 "user_id": "27",
                 "user_type": "Staff",
                 "order_type": "canteen",
                 "order_total": "1.00",
                 "coupon_code": "",
                 "discount_amount": "0.00",
                 "delivery_amount": "0.00",
                 "payment_mode": "ccavenue",
                 "total_tax_amount": "0.00",
                 "order_net_total": "1.00",
                 "delivery_user_name": "Aman Das",
                 "delivery_phone_number": "9062688260",
                 "delivery_address": "",
                 "delivery_block": "",
                 "delivery_floor": "6th floor",
                 "delivery_room_no": "",
                 "payment_id": "113539890665",
                 "payment_status": "1",
                 "status": "1",
                 "payment_date": "2024-11-14",
                 "created_at": "2024-11-14T10:03:56.000000Z",
                 "updated_at": "2024-11-14T10:04:46.000000Z",
                 "order_for": "Dinner",
                 "delivery_time": "18:30:00",
                 "delivery_department": "",
                 "delivery_building": "",
                 "order_otp": "493492"
 */
