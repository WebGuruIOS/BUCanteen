//
//  HomeView.swift
//  BUCanteen
//
//  Created by Prince on 24/09/24.
//

import SwiftUI
import PhotosUI
/*
struct HomeView: View {
    
    @State private var selectedImage: UIImage? = nil
    @State private var isActionSheetPresented = false
    @State private var isImagePickerPresented = false
    @State private var isCameraPickerPresented = false
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
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
        }
        .padding()
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
    }

//    func uploadImage(image: UIImage) {
//        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
//        isLoading = true
//
//        let url = URL(string: "https://www.bwupetpujo.in/api/updateProfileImage")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let boundary = UUID().uuidString
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        var body = Data()
//        
//        // Add image data
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"profile_image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
//        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//        body.append(imageData)
//        body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//
//        // Add parameters
//        let parameters: [String: String] = ["user_id": "27"]
//        for (key, value) in parameters {
//            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n\(value)\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        }
//
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//
//        request.httpBody = body
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                isLoading = false
//                if let error = error {
//                    print("Upload error: \(error.localizedDescription)")
//                    return
//                }
//                print("Image uploaded successfully!")
//            }
//        }.resume()
//    }}
//

//struct ImagePicker12: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//    var onImageSelected: (UIImage) -> Void
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var configuration = PHPickerConfiguration()
//        configuration.filter = .images
//        configuration.selectionLimit = 1
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        let parent: ImagePicker12
//
//        init(_ parent: ImagePicker12) {
//            self.parent = parent
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            picker.dismiss(animated: true)
//
//            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
//            provider.loadObject(ofClass: UIImage.self) { image, error in
//                DispatchQueue.main.async {
//                    if let uiImage = image as? UIImage {
//                        self.parent.selectedImage = uiImage
//                        self.parent.onImageSelected(uiImage)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct CameraPicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: UIImage?
//    var onImageSelected: (UIImage) -> Void
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.sourceType = .camera
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        let parent: CameraPicker
//
//        init(_ parent: CameraPicker) {
//            self.parent = parent
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            picker.dismiss(animated: true)
//
//            if let uiImage = info[.originalImage] as? UIImage {
//                self.parent.selectedImage = uiImage
//                self.parent.onImageSelected(uiImage)
//            }
//        }
//    }
//}
//

#Preview {
    HomeView()
}

/*
 func updateProfileImage(_: (UIImage)) {
     let userID = UserDefaults.standard.value(forKey: "userid") as? String
     let parameters:[String:Any] = [ "user_id": userID ?? ""]
     debugPrint("parameters",parameters)
     let aa = ApiService.shared.baseURL
     let baseUrl1 = aa + "\(StaticURL.uploadProfileImageApi)"
     Alamofire.upload(multipartFormData: { multipartFormData in
         let userImage = selectedImage?.jpegData(compressionQuality: 0.5)
         multipartFormData.append(userImage!, withName: "profile_image",fileName: "file.jpg", mimeType: "image/jpg")
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
                             debugPrint(responseText ?? "")
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
 */

*/
