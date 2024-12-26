//
//  DepartmentViewModel.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import Foundation


class  DepartmentDataResponse {
    static let shared = DepartmentDataResponse()
    public static func DepartmentData(api: String, parameters:[String:Any],completion:@escaping(DepartmentModel?)->Void){
        ApiService.shared.ApiRequest(api: api, method: .get, parameters: parameters){
            (data, val, error) in
            guard let data = data else {return}
            do {
                let res = try JSONDecoder().decode(DepartmentModel.self, from: data)
                completion(res)
            }
            catch{
                completion(nil)
                debugPrint("Error on parsing")
            }
        }

    }
}

/*
 import Foundation
 import Combine

 class DepartmentViewModel: ObservableObject {
     @Published var departments: [Department] = []
     
     func fetchDepartments() {
         guard let url = URL(string: "https://www.bwupetpujo.in/api/departments") else { return }
         
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 do {
                     let departments = try JSONDecoder().decode([Department].self, from: data)
                     DispatchQueue.main.async {
                         self.departments = departments
                     }
                 } catch {
                     print("Error decoding JSON: \(error)")
                 }
             }
         }.resume()
     }
 }

 */
