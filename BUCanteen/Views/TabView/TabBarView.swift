//
//  TabView.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            TabView(selection: $selectedTab) {
                // Home Tab
                HomePageView()
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                    .tag(0)
                
                // Search Tab
//                SearchView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 1 ? "magnifyingglass" : "magnifyingglass")
//                        Text("Search")
//                    }
//                    .tag(1)
                
                // Cart Tab
                CartView()
               // MyCartView()
                    .tabItem {
                        Image(systemName: selectedTab == 2 ? "cart.fill" : "cart")
                        Text("Cart")
                    }
                    .tag(1)
                
                // Profile Tab
                ProfileView()
                    .tabItem {
                        Image(systemName: selectedTab == 3 ? "person.fill" : "person")
                        Text("Profile")
                    }
                    .tag(2)
                
                // Others Tab
               // ContactUsView()
                OtherView()
                    .tabItem {
                        Image(systemName: selectedTab == 4 ? "ellipsis.circle.fill" : "ellipsis.circle")
                        Text("Others")
                    }
                    .tag(3)
            }
            .accentColor(.yellow)
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}

/*
 ZStack(alignment: .bottom){
     VStack{
         if selectedTag == 0{
             HomeView()
         }else if selectedTag == 1{
            // Category(isBoolValueTrue: .constant(false))
             StaffLoginView()
         }else if selectedTag == 2{
             LoginView()
         }else if selectedTag == 3{
            SplashView()
         }else if selectedTag == 4{
            RegisterView()
         }
     }
     ZStack{
         Image(.tabBg)
             .resizable()
             .scaledToFit()
         HStack(alignment: .center,spacing: 5, content: {
             Button(action: {
                 selectedTag = 0
             }, label: {
                 HStack(content: {
                     ZStack(){
//                                 Rectangle()
//                                     .frame(width: 56, height: 35)
//                                     .clipShape(Capsule())
//                                     .foregroundColor(selectedTag == 0 ? Color.black : Color.clear)
                         VStack(){
                             Image(.home)
                                 .resizable()
                                 .frame(width: 20, height: 20)
                                 .foregroundColor(selectedTag == 0 ? Color.white : Color.yellow)
                             Text("Home")
                                 .foregroundColor(Color.white)
                         }
                         .padding(.leading, 25)
                         
                     }
                 })
                 //.frame(maxWidth: .infinity,maxHeight:.infinity)
                 .background(Color.clear)
             })
             
             Button(action: {
                 selectedTag = 1
                 
             }, label: {
                 HStack(content: {
                     ZStack(){
//                                 Rectangle()
//                                     .frame(width: 56, height: 35)
//                                     .clipShape(Capsule())
//                                     .foregroundColor(selectedTag == 1 ? Color.black: Color.clear)
                         VStack(){
                             Image(.search)
                                 .resizable()
                                 .frame(width: 20, height: 20, alignment: .center)
                                 .foregroundColor(selectedTag == 1 ? Color.white : Color.gray)
                             Text("Search")
                                 .foregroundColor(Color.white)
                         }
                     }
                 })
                 .frame(maxWidth: .infinity,maxHeight:.infinity)
                 .background(Color.clear)
             })
             
             Button(action: {
                 selectedTag = 2
             }, label: {
                 HStack(content: {
                     ZStack(){
//                                 Rectangle()
//                                     .frame(width: 56, height: 35)
//                                     .clipShape(Capsule())
//                                     .foregroundColor(selectedTag == 2 ? Color.yellow : Color.clear)
                         VStack(){
                             Image(.cart)
                                 .resizable()
                                 .frame(width: 20, height: 20, alignment: .center)
                                 .foregroundColor(selectedTag == 2 ? Color.white : Color.gray)
                             Text("Cart")
                                 .foregroundColor(Color.white)
                         }
                         .padding(.leading, -15)
                         
                             
                     }
                 })
                 .frame(maxWidth: .infinity,maxHeight:.infinity)
                 .background(Color.clear)
             })
             
             Button(action: {
                 selectedTag = 3
             }, label: {
                 HStack(content: {
                     ZStack(){
//                                 Rectangle()
//                                     .frame(width: 56, height: 35)
//                                     .clipShape(Capsule())
//                                     .foregroundColor(selectedTag == 3 ? Color.black : Color.clear)
                         VStack(){
                         Image(.profile1)
                             .resizable()
                             .frame(width: 15, height: 20, alignment: .center)
                             .foregroundColor(selectedTag == 3 ? Color.white : Color.gray)
                         Text("PROFILE")
                             .foregroundColor(Color.white)
                     }
                         .padding(.leading, -10)
                    }
                 })
                 .frame(maxWidth: .infinity,maxHeight:.infinity)
                 .background(Color.clear)
             })
             
             Button(action: {
                 selectedTag = 4
             }, label: {
                 HStack(content: {
                     ZStack(){
//                                 Rectangle()
//                                     .frame(width: 56, height: 35)
//                                     .clipShape(Capsule())
//                                     .foregroundColor(selectedTag == 4 ? Color.black : Color.clear)
                    VStack(){
                         Image(.other)
                             .resizable()
                             .frame(width: 20, height: 20, alignment: .center)
                             .foregroundColor(selectedTag == 4 ? Color.white : Color.gray)
                         Text("OTHERS")
                             .foregroundColor(Color.white)
                     }
                    .padding(.leading, -15)
                     }
                 })
                 .frame(maxWidth: .infinity,maxHeight:.infinity)
                 .background(Color.clear)
             })
         })
         .frame(height: 0)
         .opacity(0.95)
     }
     .padding(.bottom, -5)
     
     //.padding(.horizontal,10)
     .navigationBarBackButtonHidden(true)
 }
.ignoresSafeArea(.keyboard,edges: .bottom)
.background(Color.clear)
 */

/*
 TabView(selection: $selectedTab) {
     // Home Tab
     HomeView()
         .tabItem {
             Image(systemName: selectedTab == 0 ? "house.fill" : "house")
             Text("Home")
         }
         .tag(0)
     
     // Search Tab
     LoginView()
         .tabItem {
             Image(systemName: selectedTab == 1 ? "magnifyingglass" : "magnifyingglass")
             Text("Search")
         }
         .tag(1)
     
     // Cart Tab
     StaffLoginView()
         .tabItem {
             Image(systemName: selectedTab == 2 ? "cart.fill" : "cart")
             Text("Cart")
         }
         .tag(2)
     
     // Profile Tab
     RegisterView()
         .tabItem {
             Image(systemName: selectedTab == 3 ? "person.fill" : "person")
             Text("Profile")
         }
         .tag(3)
     
     // Others Tab
     SplashView()
         .tabItem {
             Image(systemName: selectedTab == 4 ? "ellipsis.circle.fill" : "ellipsis.circle")
             Text("Others")
         }
         .tag(4)
 }
 .accentColor(.yellow)
 .background(Color.black)
 .cornerRadius(20)
 */
