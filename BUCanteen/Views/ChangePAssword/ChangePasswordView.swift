//
//  ChangePasswordView.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            
            VStack {
                // Header
                Spacer()
                HStack(alignment:.center, spacing: 2){
                    Button(action: {
                        //Buttom Action
                        dismiss()
                    }, label: {
                        Image("Back")
                            .resizable()
                            .foregroundColor(.custWhite)
                            .frame(width: 35, height: 35)
                    })
                    .padding()
                    Spacer()
                    Text("Change Password")
                        .foregroundColor(Color.white)
                        .font(.system(size: 22, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        //Buttom Action
                    }, label: {
                        Image("")
                            .resizable()
                            .foregroundColor(.custWhite)
                            .frame(width: 35, height: 35)
                    })
                    .padding(.trailing, 15)
                    .padding()
                    
                }
                .background(Color.orangetopview)
                ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 10) {
                    
                    Image("Secure")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .padding(.horizontal)
                        .padding(.top, 35)
                    
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Old Password")
                        ZStack{
                            Capsule()
                                .strokeBorder(Color.gray, lineWidth: 1)
                                .frame(height: 50)
                            HStack {
                                Image("Lock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(.leading)
                                    TextField("Old Password", text: $oldPassword)
                                        .autocapitalization(.none)
                                        .padding(.leading,5)
                            }
                        }
                        .frame(width: 335, height: 51)
                        Text("New Password")
                        ZStack{
                            Capsule()
                                .strokeBorder(Color.gray, lineWidth: 1)
                                .frame(height: 50)
                            HStack {
                                Image("Lock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(.leading)
                                    TextField("New Password", text: $newPassword)
                                        .autocapitalization(.none)
                                        .padding(.leading,5)
                            }
                        }
                        .frame(width: 335, height: 51)
                        Text("Enter confirm password")
                        ZStack{
                            Capsule()
                                .strokeBorder(Color.gray, lineWidth: 1)
                                .frame(height: 50)
                            HStack {
                                Image("Lock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(.leading)
                                    TextField("Enter confirm password", text: $confirmPassword)
                                        .autocapitalization(.none)
                                        .padding(.leading,5)
                            }
                        }
                        .frame(width: 335, height: 51)
                        Spacer()
                        // Submit Button
                        Button(action: {
                            // Action for Submit button
                            
                            validateFields()
                            
                        }) {
                            Text("Submit")
                                .font(.system(size: 19, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.custorange)
                                .cornerRadius(50)
                        }
                        .frame(width: 335, height: 51)
                    }.padding()
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
       }
    }
    
    func changePasswordApi() {
        let userid = UserDefaults.standard.value(forKey: "userid") as? String ?? ""
        let parameters:[String:Any] = ["user_id": userid,
                                       "password":newPassword,
                                       "old_password":oldPassword]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.changePasswordApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                switch responseCode {
                case 1:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
        }
    }
    
    
    func validateFields() {
        if oldPassword.isEmpty {
            AppManager.shared.showAlert(title: "", msg: "Please enter old password")
        }else if newPassword.isEmpty{
            AppManager.shared.showAlert(title: "", msg: "Please enter new password")
        }else if confirmPassword.isEmpty{
            AppManager.shared.showAlert(title: "", msg: "Please enter confirm password")
        }else if newPassword != confirmPassword{
            AppManager.shared.showAlert(title: "", msg: "New password and confirm password not matched!")
          
        }else{
            changePasswordApi()
        }
    }
}

#Preview {
    ChangePasswordView()
}
