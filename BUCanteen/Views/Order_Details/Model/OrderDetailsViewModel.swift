//
//  OrderDetailsViewModel.swift
//  BUCanteen
//
//  Created by Prince on 25/11/24.
//

import Foundation


class OrderDetailsDataResponse {
    static let shared = OrderDetailsDataResponse()
    public static func OrderDetails(api: String, parameters:[String:Any],completion:@escaping(OrderDetailsModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(OrderDetailsModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
