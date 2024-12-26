//
//  OrderListViewModel.swift
//  BUCanteen
//
//  Created by Prince on 15/11/24.
//

import Foundation

class OrderListDataResponse {
    static let shared = OrderListDataResponse()
    public static func orderListData(api: String, parameters:[String:Any],completion:@escaping(OrderListModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(OrderListModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
