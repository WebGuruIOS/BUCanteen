//
//  CartViewModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation

class CartDataResponse {
    static let shared = CartDataResponse()
    public static func CartDataValue(api: String, parameters:[String:Any],completion:@escaping(CartModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(CartModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
