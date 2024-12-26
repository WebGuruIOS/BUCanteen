//
//  ForgotPasswordView.swift
//  BUCanteen
//
//  Created by Prince on 11/11/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        
        
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
            VStack {
                
                // Background Image
                Image("Food")
                    .resizable()
                    .scaledToFill()
                    .frame( height: 250)
                    .padding(.top)
                
                VStack(spacing: 10) {
                    
                    // Spacer()
                    
                    // Logo
                    Image("Logo")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                        .padding(.bottom, 20)
                    Text("Forgot Password?")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.bottom, 0)
                    
                    VStack(alignment: .center, spacing: 12){
                        // Email TextField
                        TextField("Enter your Email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        //.padding(.horizontal, 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        // .padding()
                        
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
                    }.padding()
                    
                    
                }.padding(.top, -100)
                
                Spacer()
                
                // Address and Contact Info
                VStack {
                    Text("398, Ramkrishnapur Road, Barasat, 700125")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("+91 xxxxxxxxxx")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 10)
            }
        }
            Button(action: {
                dismiss()
            }, label: {
                Image("Back")
                    .resizable()
                    .foregroundColor(.custWhite)
                    .frame(width: 35, height: 35)
            })
            .padding(.leading, -185)
            .padding(.top, -360)
    }
       
    }
    
    func validateFields() {
        if email.isEmpty {
            AppManager.shared.showAlert(title: "", msg: "Please enter your email")
        }
        else if !AppManager.shared.isValidEmail(email: email) {
            AppManager.shared.showAlert(title: "", msg: "Please enter a valid email")
        }else{
           forgotPasswordApi()
        }
    }
    
    
    
    func forgotPasswordApi() {
        let parameters:[String:Any] = ["email":email]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.forgotPasswordApi, parameters:parameters) { (data) in
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
    
    
    
}

#Preview {
    ForgotPasswordView()
}



