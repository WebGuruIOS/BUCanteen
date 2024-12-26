//
//  LoginModel.swift
//  BUCanteen
//
//  Created by Prince on 23/10/24.
//

import Foundation
struct LoginModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:LoginResponseData?
}
struct LoginResponseData:Codable{
    var id :Int?
    var user_type:String?
    var usercode:String?
    var name:String?
    var email:String?
   // var email_verified_at :String?
    var phone_number:String?
  //  var user_ip:String?
    var department:String?
    var photo:String?
    
    var block_name :String?
    var floor_name:String?
    var room_no:String?
    var is_email_varified:Int?
    var status:Int?
    
    var created_at :String?
    var updated_at:String?
    var wallet:String?
   // var building_id:String?
    var device_token:String?
   // var building_name:String?
}


/*
 let id: Int
    let userType, usercode, name, email: String
    let emailVerifiedAt: NSNull
    let phoneNumber: String
    let userIP: NSNull
    let department, photo, blockName, floorName: String
    let roomNo: String
    let isEmailVarified, status: Int
    let createdAt, updatedAt, wallet: String
    let buildingID: NSNull
    let deviceToken: String
    let buildingName: NSNull
 */
