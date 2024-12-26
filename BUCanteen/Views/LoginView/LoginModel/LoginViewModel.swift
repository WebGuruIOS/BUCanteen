//
//  LoginViewModel.swift
//  BUCanteen
//
//  Created by Prince on 23/10/24.
//


import Foundation
class LoginResponse {
    static let shared = LoginResponse()
    public static func LoginUserData(api: String, parameters:[String:Any],completion:@escaping(LoginModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .post, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(LoginModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}

