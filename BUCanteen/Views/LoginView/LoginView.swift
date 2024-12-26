//
//  LoginView.swift
//  BUCanteen
//
//  Created by Prince on 24/09/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isStudentLogin:Bool = false
    @State private var isStaffLogin:Bool = false
    @State private var isRegister:Bool = false
    
    var body: some View {
        
            ScrollView(.vertical, showsIndicators: false){
       
                VStack {
                   
                    // Top food image
                    Image("Food")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    // Logo
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 152, height: 157)
                    // .background(Color.yellow)
                    // .clipShape(Circle())
                    //.overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(.top, -100)
                    // Buttons for different user roles
                    Button(action: {
                        // Staff login action
                        isStudentLogin = true
                    }) {
                        Text("Staff Login")
                            .foregroundColor(.white)
                            .frame(width: 330, height: 63)
                            .background(Color.orange)
                            .cornerRadius(50)
                    }
                    .navigationDestination(isPresented: $isStudentLogin) {
                        StaffLoginView()
                    }
                    .padding(.top, 20)
                    
//                    Button(action: {
//                        // Student login action
//                      //  isStudentLogin = true
//                    }) {
//                        Text("Student Login")
//                            .foregroundColor(.white)
//                            .frame(width: 330, height: 63)
//                            .background(Color.red)
//                            .cornerRadius(50)
//                    }
////                    .navigationDestination(isPresented: $isStudentLogin) {
////                        StaffLoginView()
////                    }
//                    .padding(.top, 10)
                    
                    Button(action: {
                        // Register action
                        isRegister = true
                    }) {
                        Text("Register Now")
                            .foregroundColor(.white)
                            .frame(width: 330, height: 63)
                            .background(Color.black)
                            .cornerRadius(50)
                    }.navigationDestination(isPresented: $isRegister) {
                        RegisterView()
                    }
                    
                    .padding(.top, 10)
                  
                VStack {
                        Text("398, Ramkrishnapur Road, Barasat, 700125")
                            .font(.footnote)
                        Text("+91 XXXXXXXXXX")
                            .font(.footnote)
                    }
                    .padding(.top, 140)
                
                }
//                .padding(.top, 20)
//                .background(Color.gray.opacity(0.1))
                //.edgesIgnoringSafeArea(.all)
 
        }
            .navigationBarBackButtonHidden(true)
    }
    
   
    
}

#Preview {
    LoginView()
}
