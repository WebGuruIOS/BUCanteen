//
//  DepartmentModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation


struct DepartmentModel:Codable{
    var responseCode:Int?
    var responseText:String?
    var responseData:[DepartmentResponseData]?
}

struct DepartmentResponseData:Codable{
    var id:Int?
    var department_name:String?
    var status:String?
    var created_at:String?
   // var updated_at: NULL?
}

/*
 
 struct Department: Identifiable, Codable {
     let id: Int
     let department_name: String
     
     // Map "department_id" to "id" for SwiftUI compatibility
     enum CodingKeys: String, CodingKey {
         case id = "department_id"
         case department_name
     }
 }

 */
