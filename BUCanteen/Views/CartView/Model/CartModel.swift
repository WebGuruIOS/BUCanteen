//
//  CartModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation

struct CartModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:[CartData]?
}

struct CartData: Codable, Identifiable{
    var cart_id:Int?
    var item_availability_id:Int?
    var id :Int?
    var food_item_name:String?
    var categories_id:Int?
    var item_slug:String?
    var description:String?
    var image:String?
    var price_for_canteen:String?
    var price_for_delivery:String?
    var sort_order:Int?
    var status:String?
    var created_by:Int?
    var menu_type:String?
    var is_common:Int?
    var quantity:String?
    var common_lunch :Int?
    var common_dinner:Int?
    var quantity_lc:Int?
    var quantity_ld:Int?
    var quantity_dc:Int?
    var isWishlist:String?
    var common_lunch_days:String?
    var common_dinner_days:String?
    
    
}

/*
 meta_title : null
 common_lunch_days : "["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]"
 common_dinner_days : "["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]"

 
 description : null
 meta_title : null
 
 common_lunch : 1
 common_dinner : 0
 quantity_lc : 50
 quantity_ld : 0
 quantity_dc : 0
 common_lunch_days : "["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]"
 common_dinner_days : "[]"
 isWishlist : "0"
 
 */
