//
//  paymentOnlineViewModel.swift
//  BUCanteen
//
//  Created by Prince on 11/12/24.
//

import Foundation


class  OnlinePaymentResponse {
    static let shared = OnlinePaymentResponse()
    public static func OnlinePayment(api: String, parameters:[String:Any],completion:@escaping(paymentOnlineModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(paymentOnlineModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
