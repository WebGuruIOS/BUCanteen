//
//  RegisterView.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//

import SwiftUI
import UIKit
import Alamofire

struct RegisterView: View {
    
    @State private var userType = ""
    @State private var userName = ""
    @State private var userId = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var department = ""
    @State private var buildingNumber = ""
    @State private var floorName = ""
    @State private var roomNumber = ""
    @State private var agreedToTerms = false
    @State private var isHome = false
    @Environment(\.dismiss) var dismiss
    
    
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isActionSheetPresented = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var imageUser = UIImage(named:"no-image")
    
    
    
    @available(iOS 16.0, *)
    var body: some View {
        VStack(){
            HStack {
                Button(action: {
                    // Handle back action
                    dismiss()
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                        .foregroundColor(.custorange)
                        
                }
                .padding(.leading, 10)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20) {
                // Logo
                Image("Logo_1")
                    .resizable()
                    .frame(width: 164, height: 90)
                    .padding()
                
                Text("Register")
                    .foregroundColor(.custBlack1)
                    .font(.system(size: 25, weight: .medium))
                
                // Form fields
                VStack(alignment: .leading, spacing: 10)  {
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("Profile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            Picker("User Type*", selection: $userType) {
                                Text("User Type*").tag("")
                                Text("Staff").tag("Staff")
//                                Text("Guest").tag("Guest")
//                                Text("Member").tag("Member")
                                
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.leading, 5)
                        }
                    }
                   // .frame(width: 335, height: 51)
                     
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("Profile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $userName)
                                .placeholder(when: userName.isEmpty) {
                                    Text("User Name*").foregroundColor(.black)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    /*
                     TextField("", text: $text)
                         .placeholder(when: text.isEmpty) {
                             Text("Placeholder recreated").foregroundColor(.gray)
                     }
                     */
                  //  .frame(width: 335, height: 51)
                    
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("IDBadge")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $userId)
                                .placeholder(when: userId.isEmpty) {
                                    Text("User ID*").foregroundColor(.black)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("Mail")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $email)
                                .autocapitalization(.none)
                                //.keyboardType(.alphabet)
                               // .textCase(.lowercase)
                                .placeholder(when: email.isEmpty) {
                                    Text("Email*").foregroundColor(.black)
                                       // .textCase(.lowercase)
                                        //.autocapitalization(.none)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("mobile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $mobileNumber)
                                .keyboardType(.phonePad)
                                .placeholder(when: mobileNumber.isEmpty) {
                                    Text("Mobile Number*").foregroundColor(.black)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("Department")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $department)
                                .placeholder(when: department.isEmpty) {
                                    Text("Department*").foregroundColor(.black)
                            }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("Blockname")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $buildingNumber)
                                .placeholder(when: buildingNumber.isEmpty) {
                                Text("Select Building*").foregroundColor(.black)
                        }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("FloorName")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $floorName)
                                .placeholder(when: floorName.isEmpty) {
                                Text("Floor Name*")
                                        .foregroundColor(.black)
                        }
                            .padding(.leading, 5)
                        }
                    }
                    ZStack(alignment: .leading){
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .frame(height: 51)
                        HStack {
                            Image("RoomNo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.leading)
                            TextField("", text: $roomNumber)
                                .placeholder(when: roomNumber.isEmpty) {
                                Text("Room No*").foregroundColor(.black)
                        }
                            .padding(.leading, 5)
                        }
                    }
                }
                
                // Profile Picture (using a placeholder image)
                VStack {
                    
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 106, height: 132)
                            
                    } else {
                        Image("profilepic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 106, height: 132)
                            .padding()
                    }
                    
                    Button("Choose Image") {
                        isActionSheetPresented = true
                    }
                }
                
                // Terms and conditions
                HStack(){
                    Button(action: {
                        agreedToTerms.toggle()
                    }, label: {
                        if agreedToTerms{
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }else{
                            Image("uncheck")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        
                    })
                        Text("I agree to the above")
                            .foregroundColor(Color.custFontGray)
                            .font(.system(size: 12, weight: .bold))
                    Button(action: {
                        
                    }, label: {
                            Text("terms & conditions")
                                .foregroundColor(Color.custFontGray)
                                .underline()
                                .font(.system(size: 12, weight: .bold))
                    })
    
                }
                .padding(.leading, -65)
                
                // Register button
                Button(action: {
                    validation()
                    
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 330, height: 63)
                        .font(.system(size: 19, weight: .semibold))
                        .background(Color.black)
                        .cornerRadius(50)
                }.navigationDestination(isPresented: $isHome) {
                    TabBarView()
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }.actionSheet(isPresented: $isActionSheetPresented) {
            ActionSheet(
                title: Text("Choose Image"),
                buttons: [
                    .default(Text("Camera")) {
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            imagePickerSourceType = .camera
                            isImagePickerPresented = true
                        }
                    },
                    .default(Text("Photo Library")) {
                        imagePickerSourceType = .photoLibrary
                        isImagePickerPresented = true
                    },
                    .cancel()
                ]
            )
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage, sourceType: $imagePickerSourceType)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    
    func validation(){
        if userType == ""{
            ApiService.shared.showAlert(title: "", msg: "Please select user type")
        }else if userName == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter user name")
        }else if userId == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter user id")
        }else if email == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter email")
        }else if mobileNumber == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter mobile number")
        }else if department == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter department")
        }else if buildingNumber == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter building number")
        }else if floorName == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter floor name")
        }else if roomNumber == ""{
            ApiService.shared.showAlert(title: "", msg: "Please enter room number")
        }else if selectedImage == nil{
            ApiService.shared.showAlert(title: "", msg: "Please select profile picture!")
        }else if agreedToTerms == false{
            ApiService.shared.showAlert(title: "", msg: "Please agree with terms & conditions")
        }else{
            RegisterApi1()
        }
    }
    // MARK: - Register Api
    /*
        func RegisterApi() {
            let parameters:[String:Any] = ["user_name":userName,"user_type":userType,"user_code":userId,"user_email":email, "mobile_number":mobileNumber, "department":department, "building_id":buildingNumber, "floor_name":floorName,"room_no":roomNumber,"profileimage":""]
            LoginResponse.LoginUserData(api:StaticURL.registerApi, parameters:parameters) { (data) in
                if data != nil {
                    let responseCode = data?.responseCode
                    let responseText = data?.responseText
                    print("DEBUG:- Data in Response:-",data?.responseData ?? [])
                    switch responseCode {
                    case 1:
                        ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                       // isHome = true
                    case 0:
                        ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                    default:
                       ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                    }
                }
            }
        }
    */
    
    
    
   
    func RegisterApi1() {
        let parameters:[String:Any] = ["user_name":userName,"user_type":userType,"user_code":userId,"user_email":email,"mobile_number":mobileNumber, "department":department, "building_id":buildingNumber, "floor_name":floorName,"room_no":roomNumber]
        debugPrint("parameters",parameters)
        let aa = ApiService.shared.baseURL
        let baseUrl1 = aa + "\(StaticURL.registerApi)"
        Alamofire.upload(multipartFormData: { multipartFormData in
            let userImage = selectedImage?.jpegData(compressionQuality: 0.5)
            multipartFormData.append(userImage!, withName: "profileimage",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
        },
         to:baseUrl1,headers:nil)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response.result.value ?? "")
                    guard let data = response.data else {return}
                    do {
                        let res = try
                        JSONDecoder().decode(LoginModel.self, from: data)
                        if res != nil {
                            let responseCode = res.responseCode
                            let responseText = res.responseText
                            switch responseCode {
                            case 1:
                                debugPrint(responseText)
                            case 0:
                                ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                            default:
                                debugPrint("")
                            }
                        }
                    }
                    catch{
                        
                        debugPrint("Error on parsing")
                    }
                }
            case.failure(let encodingError):
                debugPrint(encodingError)
            }
        }
    }
    
    
    
   
    /*
    func RegisterApi(){
        let baseUrl = ApiService.shared.baseURL
        let mainUrl = baseUrl + "\(StaticURL.registerApi)"
        
        let parameters:[String:Any] = ["user_name":userName,"user_type":userType,"user_code":userId,"user_email":email,"mobile_number":mobileNumber, "department":department, "building_id":buildingNumber, "floor_name":floorName,"room_no":roomNumber]
        debugPrint("parameters",parameters)
        
        
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            let imageData1 = selectedImage?.jpegData(compressionQuality: 0.5)
//            multipartFormData.append(imageData1!, withName: "selectedImage",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//            }
//        },
        
        
        
          Alamofire.upload(multipartFormData: { multipartFormData in
            let dataUserImage = selectedImage?.jpegData(compressionQuality: 0.5)
              multipartFormData.append(imageData1!, withName: "profileimage", fileName: "image1.jpg", mimeType: "image/jpeg")
              for (key, value) in parameters {
                  multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
              }
          }, to: mainUrl, method: .post, headers: nil)
          .responseJSON { response in
              switch response.result {
              case .success(let data):
                  if let jsonData = data as? [String: Any] {
                      if let responseCode = jsonData["responseCode"]{
                          print("Getting responseCode: \(responseCode)")
                      }
                      guard let redDamageID = jsonData["responseData"] else{
                          print("Invalid Damage ID")
                          return
                      }
                      print("Red Damage ID:- \(redDamageID)")
                      if let responseText = jsonData["responseText"] {
                          print("Getting Response Text: \(responseText)")
                          DispatchQueue.main.async {
                              ApiService.shared.showAlert(title: "", msg: "\(responseText)")
                          }
                      }
                  }
              case .failure(let error):
                  print("Error: \(error.localizedDescription)")
              }
          }
      }
    
     */
}




struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var sourceType: UIImagePickerController.SourceType
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    // Coordinator to handle delegate methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                parent.selectedImage = editedImage
                
            } else if let originalImage = info[.originalImage] as? UIImage {
                parent.selectedImage = originalImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    RegisterView()
}

/*
 
 func checkInApi(imageFile:UIImage){
     let user_Id = UserDefaults.standard.value(forKey: "user_id") as? String ?? ""
     let parameters:[String:Any] = [
         "taskId":taskId,
         "userId":user_Id,
         "phone":txtEmail.text!,
         "eventId":eventId,
         "lat":self.latitude,
         "lang":self.longitude
         
     ]
     debugPrint("parameters",parameters)
     let aa = ApiService.shared.baseURLLive
     let baseUrl1 = aa + "checkIn"
     Alamofire.upload(multipartFormData: { multipartFormData in
         let imageData1 = imageFile.jpegData(compressionQuality: 0.5)
         multipartFormData.append(imageData1!, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
         for (key, value) in parameters {
             multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
         }
     },
      to:baseUrl1,headers:nil)
     { (result) in
         switch result {
         case .success(let upload, _, _):
             upload.responseJSON { response in
                 debugPrint(response.result.value ?? "")
                 guard let data = response.data else {return}
                 do {
                     let res = try
                     JSONDecoder().decode(acceptDataStruct.self, from: data)
                     if res != nil {
                         let responseCode = res.responseCode
                         let responseText = res.responseText
                         switch responseCode {
                         case 1:
                             self.txtEmail.text = ""
                             self.profileImage = nil
                             self.imageUser.image = UIImage(named: "camera2")
                             
                             
                             if self.txtEmail.text != ""{
                                 self.stopGetlatLong()
                             }
                             
                             self.apiCallFirstTime()
                             
                         case 0:
                             self.txtEmail.text = ""
                             self.profileImage = nil
                             self.imageUser.image = UIImage(named: "camera2")
                             ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                         default:
                             debugPrint("")
                         }
                         
                     }
                 }
                 catch{
                     
                     debugPrint("Error on parsing")
                 }
             }
         case.failure(let encodingError):
             debugPrint(encodingError)
         }
     }
 }
 
 
 
 
 import SwiftUI
 import UIKit

 // 1. Create a wrapper for UIImagePickerController
 struct ImagePicker: UIViewControllerRepresentable {
     @Binding var selectedImage: UIImage?
     @Binding var sourceType: UIImagePickerController.SourceType
     @Environment(\.presentationMode) var presentationMode
     
     func makeUIViewController(context: Context) -> UIImagePickerController {
         let picker = UIImagePickerController()
         picker.delegate = context.coordinator
         picker.sourceType = sourceType
         picker.allowsEditing = true
         return picker
     }
     
     func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
     
     // Coordinator to handle delegate methods
     func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }
     
     class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
         let parent: ImagePicker
         
         init(_ parent: ImagePicker) {
             self.parent = parent
         }
         
         func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             if let editedImage = info[.editedImage] as? UIImage {
                 parent.selectedImage = editedImage
             } else if let originalImage = info[.originalImage] as? UIImage {
                 parent.selectedImage = originalImage
             }
             parent.presentationMode.wrappedValue.dismiss()
         }
         
         func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
             parent.presentationMode.wrappedValue.dismiss()
         }
     }
 }

 // 2. SwiftUI View with Action Sheet for Image Source Selection
 struct RegisterView: View {
     @State private var selectedImage: UIImage?
     @State private var isImagePickerPresented = false
     @State private var isActionSheetPresented = false
     @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
     
     var body: some View {
         VStack {
             if let image = selectedImage {
                 Image(uiImage: image)
                     .resizable()
                     .scaledToFit()
                     .frame(height: 200)
             } else {
                 Text("Select an Image")
                     .padding()
             }
             
             Button("Choose Image") {
                 isActionSheetPresented = true
             }
         }
         .actionSheet(isPresented: $isActionSheetPresented) {
             ActionSheet(
                 title: Text("Choose Image"),
                 buttons: [
                     .default(Text("Camera")) {
                         if UIImagePickerController.isSourceTypeAvailable(.camera) {
                             imagePickerSourceType = .camera
                             isImagePickerPresented = true
                         }
                     },
                     .default(Text("Photo Library")) {
                         imagePickerSourceType = .photoLibrary
                         isImagePickerPresented = true
                     },
                     .cancel()
                 ]
             )
         }
         .sheet(isPresented: $isImagePickerPresented) {
             ImagePicker(selectedImage: $selectedImage, sourceType: $imagePickerSourceType)
         }
     }
 }
 
 
 // Assuming you have your image as a UIImage
 if let image = profileImage {
     // Convert UIImage to Data (JPEG with compression quality)
     let imageData = image.jpegData(compressionQuality: 0.7)
     
     // Encode the data to base64 string
     let base64ImageString = imageData?.base64EncodedString(options: .lineLength64Characters) ?? ""
     
     // Create the parameters dictionary with base64 encoded image string
     let parameters: [String: Any] = [
         "department": "Development",
         "building_id": "7575",
         "user_name": "Dfgdfgdfg",
         "user_type": "Staff",
         "user_code": "232323",
         "user_email": "test@gmail.com",
         "floor_name": "2nd",
         "room_no": "125",
         "profileimage": base64ImageString, // Use base64 encoded string instead of UIImage
         "mobile_number": "5585555"
     ]
     
     // Now you can use 'parameters' dictionary to send to your server
 }


 */
/*
 func CarrosserieDamageApi(){
       LoaderManager.shared.showLoader()
       guard let userID = UserDefaults.standard.string(forKey: "UserID") else{print("Invalid user ID")
           return}
//        guard let carClientID = UserDefaults.standard.string(forKey: "CarClientId") else{return}
       guard let carrosserieNumber = carrosserieNumberTF.text else{return}
       let url = ApiService.shared.baseURL + "addRedDamage"
       let parameters = ["carrosserieNumber":carrosserieNumber,
                         "carClientsId":clientCarId,
                         "userId":userID,
                         "serviceBookImage":""]
       AF.upload(multipartFormData: { multipartFormData in
           multipartFormData.append(self.datacarrosserieImage ?? Data(), withName: "carroserrieNumberPhoto", fileName: "image1.jpg", mimeType: "image/jpeg")
           for (key, value) in parameters {
               multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
           }
       }, to: url, method: .post, headers: nil)
       .responseJSON { response in
           LoaderManager.shared.hideLoader()
           switch response.result {
           case .success(let data):
               if let jsonData = data as? [String: Any] {
                   if let responseCode = jsonData["responseCode"]{
                       print("Getting responseCode: \(responseCode)")
                   }
                   guard let redDamageID = jsonData["responseData"] else{
                       print("Invalid Damage ID")
                       return
                   }
                   print("Red Damage ID:- \(redDamageID)")
                   DispatchQueue.main.async {
                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "ExteriorVC") as! ExteriorVC
                       vc.clientCarId = self.clientCarId
                       vc.commingFrom = self.isCommingFrom
                       vc.redDameId = redDamageID as? String ?? ""
                       vc.carrosserieNumber = carrosserieNumber
                       vc.carroserrieNumberPhoto = self.datacarrosserieImage
                       self.navigationController?.pushViewController(vc, animated: true)
                   }
                   if let responseText = jsonData["responseText"] {
                       print("Getting Response Text: \(responseText)")
                       DispatchQueue.main.async {
                           ApiService.shared.showAlert(title: "", msg: "\(responseText)")
                       }
                   }
               }
           case .failure(let error):
               print("Error: \(error.localizedDescription)")
           }
       }
   }
 */
