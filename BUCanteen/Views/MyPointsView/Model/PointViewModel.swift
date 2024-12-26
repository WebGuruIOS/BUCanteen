//
//  PointViewModel.swift
//  BUCanteen
//
//  Created by Prince on 12/11/24.
//

import Foundation

class PointDataResponse {
    static let shared = PointDataResponse()
    public static func PointAllData(api: String, parameters:[String:Any],completion:@escaping(PointModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(PointModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
