//
//  ProfileModel.swift
//  BUCanteen
//
//  Created by Prince on 07/11/24.
//

import Foundation

struct ProfileModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:ProfileResponseData?
}

struct ProfileResponseData:Codable{
    var id:String?
    var userType:String?
    var userCode:String?
    var name:String?
    var email:String?
    var phoneNumber:String?
    var department:String?
    var photo:String?
    var blockName:String?
    var floorName:String?
    var roomNo:String?
    var wallet:String?
    var buildingId:String?
}

/*
 
 */
