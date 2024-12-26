//
//  StaffLoginView.swift
//  BUCanteen
//
//  Created by Prince on 24/09/24.
//

import SwiftUI

struct StaffLoginView: View {
    @State private var email = "STF123456"
    @State private var password = "nopass"
    @State private var isAgreed = false
    @State private var isPasswordVisible: Bool = false
    @State private var isHome: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(){
            VStack {
                Button(action: {
                    // Handle back action
                    dismiss()
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.custGray2)
                }
               
                .padding(.horizontal)
                .padding(.leading, -200)
               
               // Spacer()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        // Logo and title
                        Image("Logo_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 164, height: 90)
                        
                        Text("Staff Login")
                            .foregroundColor(.custBlack1)
                            .font(.system(size: 25, weight: .medium))
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
                        // Textfields for email and password
                        VStack(alignment: .leading, spacing: 15){
                            ZStack{
                                Capsule()
                                    .strokeBorder(Color.gray, lineWidth: 1)
                                    .frame(height: 50)
                                HStack {
                                    Image("Profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(.leading)
                                    TextField("User Code", text: $email)
                                        .autocapitalization(.none)
                                        .padding(.leading, 5)
                                }
                            }
                            .frame(width: 335, height: 51)
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
                                    if isPasswordVisible {
                                        TextField("Password", text: $password)
                                            .autocapitalization(.none)
                                            .padding(.leading,5)
                                    } else {
                                        SecureField("Password", text: $password)
                                            .padding(.leading,5)
                                    }
                                    
                                    Button(action: {
                                        isPasswordVisible.toggle()
                                    }, label: {
                                        Image(isPasswordVisible ? "closedEye" : "OpenEye")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 25, height: 25)
                                    })
                                    .padding(.trailing, 30)
                                }
                            }
                            .frame(width: 335, height: 51)
                        }
                        
                        // Policy text
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image("foodBox")
                                    .resizable()
                                    .frame(width: 57, height: 57)
                                //  .aspectRatio(contentMode: .fit)
                                //  .padding(.leading)
                                Text("Online orders are to be placed before 10:30 AM for lunch and before 5:00 PM for evening snacks & dinner.")
                                    .foregroundColor(Color.custFontGray)
                                    .font(.system(size: 12, weight: .bold))
                            }
                            HStack {
                                Image("lunchList")
                                    .resizable()
                                    .frame(width: 57, height: 57)
                                Text("Lunch orders cannot be cancelled after 11:00 AM and will be delivered after 30 minutes of placing the order or after 11:30 AM, whichever is later.")
                                    .foregroundColor(Color.custFontGray)
                                    .font(.system(size: 12, weight: .bold))
                            }
                            HStack {
                                Image("foodHand")
                                    .resizable()
                                    .frame(width: 57, height: 57)
                                Text("Evening snacks & dinner orders cannot be cancelled after 5:30 PM and will be delivered after 30 minutes of placing the order or after 6:00 PM, whichever is later.")
                                    .foregroundColor(Color.custFontGray)
                                    .font(.system(size: 12, weight: .bold))
                            }
                            HStack {
                                Image("ratingFood")
                                    .resizable()
                                    .frame(width: 57, height: 57)
                                Text("Upon order cancellation, the amount will be deposited to the point balance, which can only be used for subsequent orders. Points balance cannot be redeemed for refund.")
                                    .foregroundColor(Color.custFontGray)
                                    .font(.system(size: 12, weight: .bold))
                            }
                        }
                        .font(.footnote)
                        .padding()
                        
                        // Checkbox for terms and conditions
                        
                        HStack(){
                            Button(action: {
                                isAgreed.toggle()
                            }, label: {
                                if isAgreed{
                                    Image("check")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    
                                }else{
                                    Image("uncheck")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
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
                       // .padding(.top, 10)
                        //.padding(.horizontal)
                        .padding(.leading, -50)
                        
                        
                        // Login button
                        Button(action: {
                            // Perform login
                            validateFields()
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .font(.system(size: 19, weight: .bold))
                                .frame(width: 330, height: 63)
                                .background(Color.custyellow)
                                .cornerRadius(50)
                        }
                        .navigationDestination(isPresented: $isHome) {
                            TabBarView()
                        }
                        .padding(.top, 15)
                        .padding(.bottom, 35)
                    }
                    .padding(.top)
                }
                
                //.background(Color.gray.opacity(0.1))
                //.edgesIgnoringSafeArea(.all)
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    func validateFields() {
        if email.isEmpty {
            AppManager.shared.showAlert(title: "", msg: "Please enter user code")
        }
//        else if !AppManager.shared.isValidEmail(email: email) {
//            AppManager.shared.showAlert(title: "", msg: "Please enter a valid email")
//        }
        else if password.isEmpty {
            AppManager.shared.showAlert(title: "", msg: "Please enter your password")
        }else if isAgreed != true {
            AppManager.shared.showAlert(title: "", msg: "Please agree with terms & conditions")
        }else {
            //isHome = true
            logApi()
        }
        
    }
    
    // MARK: - Login Api
        func logApi() {
            let emailId = email
            print("Phoneno is :- \(emailId)")
           // let password = password
            let parameters:[String:Any] = ["user_password": password,"user_code": emailId,"user_type": "staff","deviceToken": "deviceToken"]
            LoginResponse.LoginUserData(api:StaticURL.loginApi, parameters:parameters) { (data) in
                if data != nil {
                    let responseCode = data?.responseCode
                    let responseText = data?.responseText
                    let responseData = data?.responseData
                    let userID = responseData?.id
                    let strUserID = String(userID ?? 0)
                    UserDefaults.standard.setValue(strUserID, forKey: "userid")
                    UserDefaults.standard.setValue(responseData?.user_type, forKey: "userType")
                    UserDefaults.standard.setValue(responseData?.name, forKey: "userName")
                    UserDefaults.standard.setValue(responseData?.email, forKey: "userEmail")
                    UserDefaults.standard.setValue(responseData?.phone_number, forKey: "userPhone")
                    //
                    
                    
                    print("DEBUG:- Data in Response:-",responseData ?? [])
                    switch responseCode {
                    case 1:
                        isHome = true
                    case 0:
                        ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                    default:
                       ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                    }
                }
            }
        }
}
/*
 
    "user_password": "nopass@123",
    "user_code": "STF123456",
    "user_type": "staff",
    "deviceToken": "deviceToken"
 
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .green : .gray)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
*/

#Preview {
    StaffLoginView()
}

/*
 if (response.getResponseCode() == 1) {
                 successToast(response.getResponseText());
                 spManager.setString(SPManager.SPConst.USER_ID, String.valueOf(response.getResponseData().getId()));
                 spManager.setString(SPManager.SPConst.USER_TYPE, response.getResponseData().getUserType());
                 spManager.setString(SPManager.SPConst.USER_CODE, response.getResponseData().getUsercode());
                 spManager.setString(SPManager.SPConst.USER_NAME, response.getResponseData().getName());
                 spManager.setString(SPManager.SPConst.USER_EMAIL, response.getResponseData().getEmail());
                 spManager.setString(SPManager.SPConst.USER_PHONE_NUMBER, response.getResponseData().getPhoneNumber());
                 spManager.setString(SPManager.SPConst.DEPARTMENT, response.getResponseData().getDepartment());
                 spManager.setString(SPManager.SPConst.USER_PHOTO, response.getResponseData().getPhoto());
                 spManager.setString(SPManager.SPConst.BLOCK_NAME, response.getResponseData().getBlockName());
                 spManager.setString(SPManager.SPConst.FLOOR_NAME, response.getResponseData().getFloorName());
                 spManager.setString(SPManager.SPConst.ROOM_NO, response.getResponseData().getRoomNo());
                 spManager.setString(SPManager.SPConst.IS_EMAIL_VERIFY, String.valueOf(response.getResponseData().getIsEmailVarified()));
                 spManager.setString(SPManager.SPConst.STATUS, String.valueOf(response.getResponseData().getStatus()));
                 spManager.setString(SPManager.SPConst.CREATED_AT, response.getResponseData().getCreatedAt());
                 spManager.setString(SPManager.SPConst.UPDATED_AT, response.getResponseData().getUpdatedAt());
                 spManager.setString(SPManager.SPConst.WALLET, response.getResponseData().getWallet());
                 spManager.setString(SPManager.SPConst.BUILDING_ID, String.valueOf(response.getResponseData().getBuildingId()));
                 spManager.setString(SPManager.SPConst.BUILDING_NAME, response.getResponseData().getBuildingName());
                 startActivity(new Intent(SubLoginActivity.this, HomeActivity.class)
                         .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK));
             }

 */
