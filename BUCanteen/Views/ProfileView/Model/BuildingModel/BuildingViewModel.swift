//
//  BuildingViewModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation
import Combine

class  BuildingDataResponse {
    static let shared = BuildingDataResponse()
    public static func BuildingData(api: String, parameters:[String:Any],completion:@escaping(BuildingModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .get, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(BuildingModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}




 
