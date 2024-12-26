//
//  AlamofireServiceCell.swift
//  CheckMy Vitals
//
//  Created by Abhay Kumar on 03/01/23.
//

import Foundation
import UIKit
import Alamofire
import NVActivityIndicatorView

class ApiService {
    var showLoder:Bool = true
    static let shared = ApiService()
    var baseURL = "https://www.bwupetpujo.in/beta/api/"
    
//    /*----- Base Url -----*/
//       //String BASE_URL = "https://www.bwupetpujo.in/beta/api/"; //DEV
//       String BASE_URL = "https://www.bwupetpujo.in/api/"; //Live
    

    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        if let topController = UIApplication.shared.windows[0].rootViewController {
            topController.present(alert, animated: true, completion: nil)
        }
        let when = DispatchTime.now()  + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
  
    //    MARK: - Converting Image To Base64
        func convertImageToBase64(_ image: UIImage) -> String? {
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil }
            let base64String = imageData.base64EncodedString()
            return base64String
        }
    
    func ApiRequest(api: String, method: HTTPMethod, parameters: [String: Any], completion: @escaping (Data?, Any?, Error?) -> Void) {
        if Reachability.isConnectedToNetwork() {
            if showLoder {
                let activityIndicatorSize = CGSize(width: 42, height: 42)
                let activityData = ActivityData(size: activityIndicatorSize, message: "", messageFont: nil, type: NVActivityIndicatorType.circleStrokeSpin, color: UtilityVC.hexStringToUIColor(hex: "43c59e"), padding: 2, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: .clear, textColor: .white)
                NVActivityIndicatorPresenter.sharedInstance.setMessage("")
                NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
            }
            let baseUrl = baseURL
            guard let url = URL(string: baseUrl + api) else {
                completion(nil, nil, nil)
                debugPrint("Invalid URL")
                return
            }
            debugPrint("DEBUG:-ApiName", api)
            debugPrint("DEBUG:-CompleteUrl:", url)
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            if method == .post{
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                } catch {
                    completion(nil, nil, error)
                    return
                }
            }
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(nil, nil, error)
                        debugPrint("DEBUG:-error on service call", error.localizedDescription)
                    } else {
                        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                            completion(nil, nil, NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil))
                            return
                        }
                        completion(data, nil, nil)
                    }
                    if self.showLoder {
                        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    }
                }
            }
        task.resume()
        } else {
            ApiService.shared.showAlert(title: "", msg: "DEBUG:-Oops! no internet connection")
        }
    }
}

