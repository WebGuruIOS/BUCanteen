//
//  HomeModel.swift
//  BUCanteen
//
//  Created by Prince on 30/11/24.
//

import Foundation


struct HomeDataModel:Codable {
   var responseText : String
    var responseCode : Int
    var responseData: homeResponseData?
    
}


struct homeResponseData:Codable {
    var Banner: [bannerData]?
    var mainCourse:[mainCourseData]?
    var additionalItem:[additionalItemData]?
}

struct bannerData:Codable,Identifiable {
    var id : String?
    var image : String?
}

struct mainCourseData: Codable, Identifiable {
    var id : Int?
    var cartCount : Int?
    var cartId : String?
    var menuId : Int?
    var available : String?
    var availablInLunch : String?
    var  availableInDinner : String?
    var  description : String?
    var  quantityForCanteen : Int?
    var priceForCanteen : String?
    var quantityForDelivery :Int?
    var priceForDelivery : String?
    var  foodId : Int?
    var foodItemName : String?
    var itemSlug : String?
    var foodDescription : String?
    var image : String?
}

struct additionalItemData: Codable, Identifiable {
    var id : Int?
    var cartCount : Int?
    var cartId : String?
    var menuId : Int?
    var available : String?
    var availablInLunch : String
    var availableInDinner : String?
    var description : String?
    var quantityForCanteen : Int?
    var priceForCanteen : String?
    var quantityForDelivery : Int?
    var priceForDelivery : String?
    var foodId :Int?
    var foodItemName : String?
    var itemSlug : String
    var foodDescription : String?
    var image : String?
}



//id : 7461
//cartCount : 0
//cartId : ""
//menuId : 33
//available : "Y"
//availablInLunch : "Y"
//availableInDinner : "Y"
//description : "
//Any one as per availibilaty
//
//"
//quantityForCanteen : 30
//priceForCanteen : "₹30.00"
//quantityForDelivery : 0
//priceForDelivery : "₹31.00"
//foodId : 33
//foodItemName : "Veg Tarka / Kabuli Chana / Rajma"
//itemSlug : "veg-tarka-kabuli-chana-rajma"
//foodDescription : "
//Any one as per availibilaty
//
//"
//image : "https://www.bwupetpujo.in/admin/uploads/images/food/food-item-image-1706421945.jpeg"
