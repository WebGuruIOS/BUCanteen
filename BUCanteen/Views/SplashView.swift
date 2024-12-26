//
//  SplashView.swift
//  BUCanteen
//
//  Created by Prince on 24/09/24.
//

import SwiftUI

struct SplashView: View {
    @State private var showLogin = true
    @State private var userID = ""
    
    var body: some View {
        
     
         NavigationStack{
             ZStack {
                 Image("Splash")
                     .resizable()
                     .edgesIgnoringSafeArea(.all)
                     
             } .navigationDestination(isPresented: $showLogin, destination: {
                                     LoginView()
                                 })
             
 //            if userID != nil{
 //                .navigationDestination(isPresented: $showLogin, destination: {
 //                    TabBarView()
 //                })
 //            }else{
 //                .navigationDestination(isPresented: $showLogin, destination: {
 //                    LoginView()
 //                })
 //            }
           
         }

      

    }
}

#Preview {
    SplashView()
}

