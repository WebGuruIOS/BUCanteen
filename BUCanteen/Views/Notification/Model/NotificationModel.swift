//
//  NotificationModel.swift
//  BUCanteen
//
//  Created by Prince on 20/11/24.
//

import Foundation

struct NotificationModel:Codable{
   let responseCode : Int
    let responseText : String
    let responseData:[NotificationData]?
}

struct NotificationData:Codable, Identifiable{
    let id : Int
    let user_id : Int
    let message : String
    let viewed : String
   // let created_at : String
    let date_time : String
}
