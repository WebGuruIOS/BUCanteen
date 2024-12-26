//
//  NotificationViewModel.swift
//  BUCanteen
//
//  Created by Prince on 20/11/24.
//

import Foundation

class NotificationDataResponse {
    static let shared = NotificationDataResponse()
    public static func NotifiDataValue(api: String, parameters:[String:Any],completion:@escaping(NotificationModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(NotificationModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
