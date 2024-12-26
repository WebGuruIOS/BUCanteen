//
//  timeSlotViewModel.swift
//  BUCanteen
//
//  Created by Prince on 10/12/24.
//

import Foundation

class  timeSlotResponse {
    static let shared = timeSlotResponse()
    public static func timeSlot(api: String, parameters:[String:Any],completion:@escaping(timeSlotData?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(timeSlotData.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
