//
//  HomeViewModel.swift
//  BUCanteen
//
//  Created by Prince on 30/11/24.
//

import Foundation


class  HomeDataResponse {
    static let shared = HomeDataResponse()
    public static func homeData(api: String, parameters:[String:Any],completion:@escaping(HomeDataModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(HomeDataModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}
