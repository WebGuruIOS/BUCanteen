//
//  ContactUsView.swift
//  BUCanteen
//
//  Created by Prince on 27/09/24.
//

import SwiftUI

struct ContactUsView: View {
    @State private var message: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(){
            VStack {
                // Header
                 Spacer()
                HStack {
                    Button(action: {
                       dismiss()
                    }) {
                        Image("Back")
                            .resizable()
                            .foregroundColor(.custWhite)
                            .frame(width: 36,
                                   height: 36)
                    }
                    Spacer()
                    Text("Contact Us")
                        .foregroundColor(.custWhite)
                        .font(.system(size: 22, weight: .medium))
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundColor(.clear)
                }
                .padding()
                .background(Color.orange)
                ScrollView(.vertical, showsIndicators: false){
                // Contact Info Section
                VStack(spacing: 0){
                    HStack {
                        Image("location")
                            .resizable()
                            .frame(width: 51, height: 50)
                        VStack(alignment: .leading) {
                            Text("Address")
                                .foregroundColor(.custGray2)
                                .font(.system(size: 16, weight: .medium))
                            Text("398, Ramkrishnapur Road,\nBarasat, 700125")
                                .foregroundColor(.custFontGray)
                                .font(.system(size: 14, weight: .medium))
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    // .cornerRadius(10)
                    // .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    HStack {
                        Image("call")
                            .resizable()
                            .frame(width: 51, height: 50)
                        VStack(alignment: .leading) {
                            Text("Phone")
                                .foregroundColor(.custGray2)
                                .font(.system(size: 16, weight: .medium))
                            Text("1234567897")
                                .foregroundColor(.custFontGray)
                                .font(.system(size: 14, weight: .medium))
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    //.cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Message Section
                VStack() {
                    VStack(alignment: .leading, spacing: 15){
                        Text("Message")
                        HStack(){
                            Image("write")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("Enter your message")
                        }
                       
                        TextEditor(text: $message)
                            .frame(height: 150)
                            .padding(8)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle  (cornerRadius: 25)
                                    .stroke(Color.colorBoarde, lineWidth: 1)
                            )
                        VStack(){
                          // For alignment manage
                        }
                        .frame(height: 80)
                       
                        // Submit Button
                        Button(action: {
                            // Submit action
                            validateFields()
                            
                        }) {
                            Text("Submit")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(25)
                        }
                        .frame(width: 330, height: 63)
                        .padding(.bottom, 20)
                    }
                    .padding()
                    
                   
                }
                .background(Color.custWhite)
                .cornerRadius(10)
                .padding()
                
                /*
                 // MESSAGE
                 ZStack(alignment: .topLeading) {
                 // Placeholder text
                 
                 if message.isEmpty {
                 Image("write")
                 .resizable()
                 .frame(width: 22, height: 22)
                 .padding(.vertical, 8)
                 Text("Enter your message...")
                 .foregroundColor(.red)
                 .padding(.horizontal, 8)
                 .padding(.vertical, 8)
                 }
                 
                 // TextEditor for multi-line input
                 TextEditor(text: $message)
                 // .padding(.top, 5)
                 .cornerRadius(25)
                 .overlay(
                 RoundedRectangle  (cornerRadius: 25)
                 .stroke(Color.colorBoarde, lineWidth: 1)
                 )
                 }
                 .padding([.leading, .trailing], 20)
                 .frame(height: 150)
                 */
            }
            .background(Color.custBgColor)
            .navigationBarBackButtonHidden(true)
          }
        }
    }
    
    
    
    
    func contactUsApi() {
        let userName = UserDefaults.standard.value(forKey: "userName") as? String ?? ""
        let userNumber = UserDefaults.standard.value(forKey: "userPhone") as? String ?? ""
        let userEmail = UserDefaults.standard.value(forKey: "userEmail") as? String ?? ""
        let parameters:[String:Any] = ["first_name":userName,
                                       "last_name":"",
                                       "email":userEmail,
                                       "inquiry":message,
                                       "contact_no":userNumber,
                                       "phone_code":"91"]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.contactUsApi, parameters:parameters) { (data) in
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
        if message.isEmpty {
            AppManager.shared.showAlert(title: "", msg: "Please enter message")
        }else{
            contactUsApi()
        }
    }
}

#Preview {
    ContactUsView()
}
