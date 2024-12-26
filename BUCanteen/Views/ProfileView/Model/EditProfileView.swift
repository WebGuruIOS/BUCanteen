//
//  EditProfileView.swift
//  BUCanteen
//
//  Created by Prince on 30/09/24.
//

import Foundation
import SwiftUI
import DropDown
import UIKit
import Alamofire
import PhotosUI



struct EditProfileView: View {
    
    @State private var userId = ""
    @State private var userName = ""
    @State private var email = ""
    @State private var mobileNumber = ""
    @State private var department = ""
    @State private var buildingName = ""
    @State private var floorName = ""
    @State private var roomNumber = ""
    @State private var buildingDataArr:[BuildingResponseData]?
    @State private var buildingDropArr:[String] = []
    @State private var isNotificationView:Bool = false
    @State private var departmentDataArr:[DepartmentResponseData]?
    @State private var departmentDropArr:[String] = []
    
    @State private  var userImage:String  = ""
    
    
    @State private var selectedImage: UIImage? = nil
    @State private var isActionSheetPresented = false
    @State private var isImagePickerPresented = false
    @State private var isCameraPickerPresented = false
    @State private var isLoading = false
    
    
//    @State private var isActionSheetPresented = false
//    @State private var selectedProfileImage: UIImage?
//   
//    @State private var selectedImage: UIImage?
//    @State private var isImagePickerPresented = false
//    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
//    @State private var imageUser = UIImage(named:"no-image")
//    
    
   // @State private var selectedDepartment = "NA"
    //@State private var selectedBuilding: ""
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(){
            Spacer()
            HStack(alignment:.center, spacing: 25){
                Button(action: {
                    dismiss()
                }, label: {
                    Image("Back")
                        .resizable()
                        .foregroundColor(.custWhite)
                        .frame(width: 35, height: 35)
                })
                .padding()
                Spacer()
                Text("Edit Profile")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .medium))
                
                Spacer()
                
                Button(action: {
                    isNotificationView = true
                }, label: {
                    Image("Notification")
                        .resizable()
                        .foregroundColor(.custWhite)
                        .frame(width: 35, height: 35)
                }).navigationDestination(isPresented: $isNotificationView) {
                    NotificationView()
                }
                .padding(.trailing, 15)
                .padding()
            }.frame(height: 50)
            .background(Color.orangetopview)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.center,spacing: 0){
//                    Image("Man")
//                        .resizable()
//                        .frame(width: 133, height: 133)
//                        .padding(.top)
                    
                    
                   
                    
//                    if selectedImage != nil {
//                       Text("No Image")
//                    }else{
//                        Text("No Image")
//                    }
                    
                    
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 133, height: 133)
                            .cornerRadius(50)
                            .padding(8)
                            .padding(.top)
                    } else {
                        AsyncImage(url:URL(string:userImage)){ result in
                            result.image?
                                .resizable()
                                .cornerRadius(50)
                                .frame(width: 133, height: 133)
                                .padding(8)
                                .padding(.top)
                        }
//                        Image("Man")
//                            .resizable()
//                            .frame(width: 133, height: 133)
//                            .padding(.top)
                    }
                    
                    Button(action: {
                        //Buttom Action
                        isActionSheetPresented.toggle()
                    }, label: {
                        Image("Edit")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding(8)
                           // .padding(.top, -10)
                            .background(Color.black)
                            .cornerRadius(25)
                    })
                    if isLoading {
                        ProgressView()
                            .padding()
                    }
                }
                
                
               /*
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 200)
                        .overlay(
                            Text("No Image Selected")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                        .cornerRadius(10)
                }

                Button(action: {
                    isActionSheetPresented.toggle()
                }) {
                    Text("Select Image")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                if isLoading {
                    ProgressView()
                        .padding()
                }
                */
                
                
                
                

                VStack(alignment:.leading,spacing: 15){
                // USER NAME
                VStack(alignment:.leading,spacing: 15){
                    Text("User Name")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    //.padding(.leading)
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
                            TextField("User Name", text: $userName)
                                .autocapitalization(.none)
                                .padding(.leading, 5)
                        }
                    }
                }
                
                // Mobile Number
                VStack(alignment:.leading,spacing: 15){
                    Text("Mobile Number")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    //.padding(.leading)
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
                            TextField("Mobile Number", text: $mobileNumber)
                                .autocapitalization(.none)
                                .padding(.leading, 5)
                        }
                    }
                }
                
                // Department
                VStack(alignment:.leading,spacing: 15){
                    Text("Department")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    //.padding(.leading)
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
                            
//                            TextField("Department", text: $department)
//                                .lineLimit(1)
//                                .padding(.vertical)
//                                .padding(.leading, 5)
////                                .disabled(true)
                            
                            Picker("Department", selection: $department) {
                                ForEach(departmentDropArr, id: \.self) { department in
                                    Text(department)
                                        .lineLimit(1)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // You can change the style as needed
                            .padding()
                            
                           // Text(department)
                            
                            
                            // Select Department
                            Button(action: {
                                // Handle Select Department logic
                                
                            }) {
                                Image("down-arrow")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    //.padding()
                            }
                            .padding()
                           
                        }
                    }
                }
                
                // Block Name
                VStack(alignment:.leading,spacing: 15){
                    Text("Building")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    //.padding(.leading)
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
                            
//                            TextField("Select Building*", text: $buildingName)
//                                .autocapitalization(.none)
//                                .padding(.leading, 5)
//                                .disabled(true)
                            
                            Picker("Department", selection: $buildingName) {
                                ForEach(buildingDropArr, id: \.self) { building in
                                    Text(building)
                                        .lineLimit(1)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()) // You can change the style as needed
                            .padding()
                            
                            
                            // Select Building button
                            Button(action: {
                                // Handle Select Building logic
                               // BuildingApi()
                                
                            }) {
                               
                                Image("down-arrow")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    //.padding()
                            }
                        }
                    }
                }
                
                // Floor Name
                VStack(alignment:.leading,spacing: 15){
                    Text("Floor Name")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    
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
                            TextField("Floor Name", text: $floorName)
                                .autocapitalization(.none)
                                .padding(.leading, 5)
                        }
                    }
                }
                
                // Room No
                VStack(alignment:.leading,spacing: 15){
                    Text("Room No")
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 13, weight: .medium))
                    
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
                            TextField("Room No", text: $roomNumber)
                                .autocapitalization(.none)
                                .padding(.leading, 5)
                        }
                    }
                }
                .padding(.bottom)
            }
                .padding()
    }
            // Update button
            Button(action: {
                // Handle update logic
                updateProfileApi()
            }) {
                Text("Update")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 330, height: 63)
                    .font(.system(size: 19, weight: .semibold))
                    .background(Color.custorange)
                    .cornerRadius(50)
            }
            .padding(.horizontal)
        }.onAppear { self.getProfileApi()}
         .onAppear{ self.BuildingApi() }
         .onAppear{ self.DeparmentApi() }
        
         .actionSheet(isPresented: $isActionSheetPresented) {
             ActionSheet(title: Text("Choose an option"), buttons: [
                 .default(Text("Gallery")) {
                     isImagePickerPresented = true
                 },
                 .default(Text("Camera")) {
                     isCameraPickerPresented = true
                 },
                 .cancel()
             ])
         }
         .sheet(isPresented: $isImagePickerPresented) {
             ImagePicker12(selectedImage: $selectedImage, onImageSelected: uploadImage)
         }
         .sheet(isPresented: $isCameraPickerPresented) {
             CameraPicker(selectedImage: $selectedImage, onImageSelected: uploadImage)
         }
  
        .navigationBarBackButtonHidden(true)
      
    }
    // Get Profile Data Api
    func getProfileApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.getProfileApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.userName = data?.responseData?.name ?? ""
                self.mobileNumber = data?.responseData?.phoneNumber ?? ""
                self.department = data?.responseData?.department ?? ""
                self.buildingName = data?.responseData?.buildingId ?? ""
                self.floorName = data?.responseData?.floorName ?? ""
                self.roomNumber = data?.responseData?.roomNo ?? ""
                self.userImage = data?.responseData?.photo ?? ""
                debugPrint("DEBUG:- Data in Response:-",data?.responseData ?? [])
                switch responseCode {
                case 1:
                    debugPrint("Sucess")
                    //ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                   // isHome = true
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
        }
    }
    
    //MARK: - Update Profile Api
    func updateProfileApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = [ "userId":userID ?? "",
                                        "name": userName,
                                        "mobile_no": mobileNumber,
                                        "department": department,
                                        "building_id": "1",
                                        "floor_name":floorName,
                                        "room_no": roomNumber]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.updateProfileApi, parameters:parameters) { (data) in
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
    
    
    func uploadImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        isLoading = true

        
        let comUrl =   ApiService.shared.baseURL + "updateProfileImage"
        let url = URL(string: comUrl)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        var body = Data()
        // Add image data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"profile_image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)

        // Add parameters
        let parameters: [String: String] = ["user_id": "27"]
        for (key, value) in parameters {
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n\(value)\r\n--\(boundary)\r\n".data(using: .utf8)!)
        }

        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                if let error = error {
                    print("Upload error: \(error.localizedDescription)")
                    return
                }
                print("Image uploaded successfully!")
            }
        }.resume()
    }
    
    
    //MARK: - Building Api
    func BuildingApi() {
        let parameters:[String:Any] = ["":""]
        debugPrint("Parameters:- ",parameters)
        BuildingDataResponse.BuildingData(api:StaticURL.getBuildinApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.buildingDataArr = data?.responseData
                debugPrint("DEBUG:- Data in Response:-",data?.responseData ?? [])
                DispatchQueue.main.async {
                    self.buildingDropArr = data?.responseData?.compactMap { $0.building_name } ?? []
                    debugPrint("buildingDropArr",self.buildingDropArr)
                }
                switch responseCode {
                case 1:
                    debugPrint("Sucess")
                    //ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
        }
    }
    
    //MARK: - Deparment Api
    func DeparmentApi() {
        let parameters:[String:Any] = ["":""]
        debugPrint("Parameters:- ",parameters)
        DepartmentDataResponse.DepartmentData(api:StaticURL.getDepartmentApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.departmentDataArr = data?.responseData
                print("DEBUG:- Data in Response:-",data?.responseData ?? [])
                DispatchQueue.main.async {
                    self.departmentDropArr = data?.responseData?.compactMap { $0.department_name } ?? []
                    debugPrint("departmentDropArr",self.departmentDropArr)
                }
                switch responseCode {
                case 1:
                    debugPrint("Sucess")
                   // ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
        }
    }
    
}

#Preview {
    EditProfileView()
}


struct ImagePicker12: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var onImageSelected: (UIImage) -> Void

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker12

        init(_ parent: ImagePicker12) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
            provider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.async {
                    if let uiImage = image as? UIImage {
                        self.parent.selectedImage = uiImage
                        self.parent.onImageSelected(uiImage)
                    }
                }
            }
        }
    }
}

struct CameraPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var onImageSelected: (UIImage) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPicker

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)

            if let uiImage = info[.originalImage] as? UIImage {
                self.parent.selectedImage = uiImage
                self.parent.onImageSelected(uiImage)
            }
        }
    }
}


