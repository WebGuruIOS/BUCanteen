//
//  NewCodeTestView.swift
//  BUCanteen
//
//  Created by Prince on 12/11/24.
//

import SwiftUI

struct NewCodeTestView: View {
    @Binding  var selectedType: String
    @Binding var showPopUp:Bool
    
    var body: some View {
        ZStack {
            // Background
            Color.black.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            // Popup Card
            VStack(spacing: 20) {
              Spacer()
                VStack(spacing: 16) {
                    Text("Order For")
                        .font(.headline)
                        .foregroundColor(.black)
                    Divider()
                    
                    Button(action: {
                        print("Serve in Canteen tapped")
                        selectedType = "Canteen"
                        UserDefaults.standard.setValue(selectedType, forKey: "selectedMood")

                        showPopUp.toggle()
                        
                    }) {
                        Text("Serve in Canteen")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        print("Takeaway tapped")
                        selectedType = "Takeaway"
                        UserDefaults.standard.setValue(selectedType, forKey: "selectedMood")
                        showPopUp.toggle()
                    }) {
                        Text("Takeaway")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                    }
                }
                .frame(height: 300)
                .padding()
                .border(.orangeCust, width: 3)
                .background(Color.white)
                .cornerRadius(20)
                 .shadow(radius: 10)
                .padding(.horizontal, 20)
                
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 175)
                   // .background(Color.white)
                    .clipShape(Circle())
                    .offset(y: -450)
                   
            }
            .padding(.top, 40)
        }
    }

  
}


#Preview {
    NewCodeTestView(selectedType: .constant(""), showPopUp: .constant(false))
}


