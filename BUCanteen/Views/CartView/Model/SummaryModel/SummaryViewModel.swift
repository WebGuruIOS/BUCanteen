//
//  SummaryViewModel.swift
//  BUCanteen
//
//  Created by Prince on 19/11/24.
//

import Foundation

class SummaryCartDataResponse {
    static let shared = SummaryCartDataResponse()
    public static func SummaryCartDataValue(api: String, parameters:[String:Any],completion:@escaping(SummaryCartModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(SummaryCartModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
