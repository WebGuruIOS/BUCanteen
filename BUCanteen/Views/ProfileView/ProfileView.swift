//
//  ProfileView.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//

import SwiftUI
import UIKit
import Alamofire

struct ProfileView: View {
    @State private var userId = ""
    @State private var email = ""
    @State private var userName = ""
    @State private var mobileNumber = ""
    @State private var isProfileNavigate:Bool = false
    @State private var isMyOrderNavigate:Bool = false
    @State private var isMyPointNavigate:Bool = false
    @State private var isChangePasswordNavigate:Bool = false
    @State private var isNotificationView:Bool = false
    @State private var isLogoutNavigate:Bool = false
    @State private  var userImage:String  = ""
    
    var body: some View {
        VStack(){
            Spacer()
            HStack(alignment:.center, spacing: 25){
                Image("")
                    .resizable()
                    .frame(width: 35, height: 35)
                Spacer()
                Text("Profile")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .medium))
                    .padding(.leading, 25)
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
                
                AsyncImage(url:URL(string:userImage)){ result in
                    result.image?
                        .resizable()
                        .frame(width: 133, height: 133)
                        .cornerRadius(50)
                        .padding(.top, 50)
                        
                }
//                .resizable()
//                .frame(width: 133, height: 133)
//                .padding(.top, 50)
            VStack(alignment: .center, spacing: 8){
                Text(userName)
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 25, weight: .regular))
                   
                Text(userId)
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 18, weight: .regular))
                Text(email)
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 18, weight: .regular))
                    .lineLimit(1)
                    .padding(.horizontal)
                
                Text(mobileNumber)
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 18, weight: .regular))
            }
            .padding(.top, 15)
          //  .padding(.horizontal)
            VStack(alignment: .leading, spacing: 8){
                // View/Update Profile
                HStack(alignment:.center, spacing: 25) {
                    Image("ManEye")
                        .resizable()
                        .frame(width: 51, height: 50)
                    Button(action: {
                        isProfileNavigate = true
                    }, label: {
                        Text("View/Update Profile")
                            .foregroundColor(Color.custFontLightGray)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image("leftAerrow")
                            .resizable()
                            .frame(width: 26, height: 26)
                    }) .navigationDestination(isPresented: $isProfileNavigate) {
                        EditProfileView()
                    }
                    
                }
                .padding([.leading, .trailing,.top], 15)
                
                //My Orders
                HStack(alignment:.center, spacing: 25)  {
                    Image("OrderList")
                        .resizable()
                        .frame(width: 51, height: 50)
                    Button(action: {
                        //Buttom Action
                        isMyOrderNavigate = true
                    }, label: {
                        Text("My Orders")
                            .foregroundColor(Color.custFontLightGray)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image("leftAerrow")
                            .resizable()
                            .frame(width: 26, height: 26)
                    
                    }).navigationDestination(isPresented: $isMyOrderNavigate) {
                        OrderListView()
                    }
                    
                }
                .padding([.leading, .trailing,.top], 15)
                
                //My Points
                HStack(alignment:.center, spacing: 25) {
                    Image("Voilet")
                        .resizable()
                        .frame(width: 51, height: 50)
                    
                    Button(action: {
                        //Buttom Action
                        isMyPointNavigate = true
                    }, label: {
                        Text("My Points")
                            .foregroundColor(Color.custFontLightGray)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image("leftAerrow")
                            .resizable()
                            .frame(width: 26, height: 26)
                    
                    }).navigationDestination(isPresented: $isMyPointNavigate) {
                        MyPointsView()
                    }

                    
                }
                .padding([.leading, .trailing,.top], 15)
                
                // Change/Update Password
                HStack(alignment:.center, spacing: 25) {
                    Image("lock1")
                        .resizable()
                        .frame(width: 51, height: 50)
                    
                    Button(action: {
                        //Buttom Action
                        isChangePasswordNavigate = true
                    }, label: {
                        
                        Text("Change/Update Password")
                            .foregroundColor(Color.custFontLightGray)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image("leftAerrow")
                            .resizable()
                            .frame(width: 26, height: 26)
                    })
                    .navigationDestination(isPresented: $isChangePasswordNavigate) {
                        ChangePasswordView()
                    }

                    
                }
                .padding([.leading, .trailing,.top], 15)
                
                //Logout
                HStack(alignment:.center, spacing: 25) {
                    Image("logOut")
                        .resizable()
                        .frame(width: 51, height: 50)
                    
                    Button(action: {
                        //Buttom Action
                    }, label: {
                        
                        Text("Logout")
                            .foregroundColor(Color.custFontLightGray)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image("leftAerrow")
                            .resizable()
                            .frame(width: 26, height: 26)
                    })
                    
                }
                .padding([.leading, .trailing,.bottom, .top], 15)
            }
            .background(Color.custWhite)
            .cornerRadius(10)
            .padding()
            //.padding([.top, .leading,.trailing, .bottom],10)
          }
        }.onAppear { self.ProfileApi() }
        .background(Color.custBgColor)
      
     
        
    }
    
    
    func ProfileApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.getProfileApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.email = data?.responseData?.email ?? ""
                self.userName = data?.responseData?.name ?? ""
                let userID = data?.responseData?.userCode ?? ""
                self.userId = "ID:\(userID)"
                self.mobileNumber = data?.responseData?.phoneNumber ?? ""
                self.userImage = data?.responseData?.photo ?? ""
                print("DEBUG:- Data in Response:-",data?.responseData ?? [])
                switch responseCode {
                case 1:
                    debugPrint("")
                   // ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                   // isHome = true
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
    ProfileView()
}
