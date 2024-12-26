//
//  PlaceOrderViewModel.swift
//  BUCanteen
//
//  Created by Prince on 11/12/24.
//

import Foundation

class  PlaceOrderResponse {
    static let shared = PlaceOrderResponse()
    public static func placeOrder(api: String, parameters:[String:Any],completion:@escaping(PlaceOrderModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(PlaceOrderModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
