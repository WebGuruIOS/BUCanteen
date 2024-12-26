//
//  OtherView.swift
//  BUCanteen
//
//  Created by Prince on 26/09/24.
//

import SwiftUI

struct OtherView: View {
    @State private var isContactUS:Bool = false
    @State private var isWishList:Bool = false
    
    var body: some View {
        VStack(){
            Spacer()
        HStack(alignment:.center, spacing: 25){
            Image("")
                .resizable()
                .foregroundColor(.custWhite)
                .frame(width: 35, height: 35)
                
                .padding()
            Spacer()
            Text("Others")
                .foregroundColor(Color.white)
                .font(.system(size: 22, weight: .medium))
                .padding(.leading, 25)
            Spacer()
            
            Button(action: {
                //Buttom Action
            }, label: {
                Image("Notification")
                    .resizable()
                    .foregroundColor(.custWhite)
                    .frame(width: 35, height: 35)
                
            })
            .padding(.trailing, 15)
            .padding()
            
           }
        .background(Color.orangetopview)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8){
                    // Contact Us
                    HStack(alignment:.center, spacing: 25) {
                        Image("call")
                            .resizable()
                            .frame(width: 51, height: 50)
                        Button(action: {
                            //Buttom Action
                            isContactUS = true
                        }, label: {
                            Text("Contact Us")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        }).navigationDestination(isPresented: $isContactUS) {
                            ContactUsView()
                        }
                        
                    }
                    .padding([.leading, .trailing,.top], 15)
                    
                    //About Us
                    HStack(alignment:.center, spacing: 25)  {
                        Image("aboutUS")
                            .resizable()
                            .frame(width: 51, height: 50)
                        Button(action: {
                            //Buttom Action
                        }, label: {
                            Text("About Us")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        
                        })
                        
                    }
                    .padding([.leading, .trailing,.top], 15)
                    
                    //My Wishlist
                    HStack(alignment:.center, spacing: 25) {
                        Image("wish")
                            .resizable()
                            .frame(width: 51, height: 50)
                        
                        Button(action: {
                            //Buttom Action
                            isWishList = true
                        }, label: {
                            Text("My Wishlist")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        
                        })
                        .navigationDestination(isPresented: $isWishList) {
                            WishlistView()
                        }
                        
                    }
                    .padding([.leading, .trailing,.top], 15)
                    
                    // Terms and Conditions
                    HStack(alignment:.center, spacing: 25) {
                        Image("termCondition")
                            .resizable()
                            .frame(width: 51, height: 50)
                        
                        Button(action: {
                            //Buttom Action
                        }, label: {
                            
                            Text("Terms and Conditions")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        })
                        
                    }
                    .padding([.leading, .trailing,.top], 15)
                    
                    //Privacy Policy
                    HStack(alignment:.center, spacing: 25) {
                        Image("Privacy")
                            .resizable()
                            .frame(width: 51, height: 50)
                        
                        Button(action: {
                            //Buttom Action
                        }, label: {
                            
                            Text("Privacy Policy")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        })
                        
                    }
                    .padding([.leading, .trailing,.bottom, .top], 15)
                    //Refund Policy
                    HStack(alignment:.center, spacing: 25) {
                        Image("refund")
                            .resizable()
                            .frame(width: 51, height: 50)
                        
                        Button(action: {
                            //Buttom Action
                        }, label: {
                            
                            Text("Refund Policy")
                                .foregroundColor(Color.custFontLightGray)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("leftAerrow")
                                .resizable()
                                .frame(width: 26, height: 26)
                        })
                        
                    }
                    .padding([.leading, .trailing,.bottom], 15)
                }
                .background(Color.custWhite)
                .cornerRadius(10)
                .padding()
            }.background(Color.custBgColor)
        }
        .background(Color.custBgColor)
    }
}

#Preview {
    OtherView()
}
