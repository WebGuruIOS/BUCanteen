//
//  ProfileViewModel.swift
//  BUCanteen
//
//  Created by Prince on 07/11/24.
//

import Foundation

class ProfileDataResponse {
    static let shared = ProfileDataResponse()
    public static func ProfileUserData(api: String, parameters:[String:Any],completion:@escaping(ProfileModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(ProfileModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}


