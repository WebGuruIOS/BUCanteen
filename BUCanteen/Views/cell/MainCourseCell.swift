//
//  MainCourseCell.swift
//  BUCanteen
//
//  Created by Prince on 30/09/24.
//

import SwiftUI

struct MainCourseCell: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            // Food Image
            Image("specialthali") // Replace with your image asset
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(8)
            
            // Food Details
            VStack(alignment: .leading, spacing: 4) {
                Text("Egg Thali")
                    .font(.headline)
                
                Text("Rice, Dal, Vaja, Sabji, Egg Curry")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            // Price and Quantity
            Text("₹55.00")
                .font(.title3)
                .foregroundColor(.red)
            HStack {
                
                
              //  Spacer()
                
                HStack {
                    Button(action: {
                        // Decrease quantity action
                    }) {
                        Image(systemName: "minus.circle")
                            .font(.title2)
                            .foregroundColor(.custFontLightGray)
                    }
                    
                    Text("1")
                        .font(.title3)
                        .padding(.horizontal, 8)
                    
                    Button(action: {
                        // Increase quantity action
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .foregroundColor(.custFontLightGray)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
        .frame(width: 180) // Adjust width as needed
        
//        VStack(){
//            VStack(){
//                Image("specialthali")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 164, height: 98)
//                    .cornerRadius(5)
//                    .padding(.top, 8)
//                VStack(alignment: .leading,spacing: 5){
//                    Text("Special Non Veg Thali")
//                        .multilineTextAlignment(.leading)
//                        .foregroundStyle(Color.custGray2)
//                        .font(.system(size: 16, weight: .medium))
//                       // .padding(.leading, -10)
//                    
//                    Text("Maecenas pharetra lacus eu tellus dignissim sed congue mauris")
//                        .foregroundStyle(Color.custFontLightGray)
//                        .font(.system(size: 12, weight: .regular))
//                    //.lineLimit(3)
//                        .multilineTextAlignment(.leading)
//                    
//                    Text("₹ 125")
//                        .foregroundStyle(Color.orangeCust)
//                        .font(.system(size: 18, weight: .bold))
//                        .padding(.top,15)
//                    
//                }
//                .padding()
//            }
//            .border(Color.colorBoarde, width: 2)
//            .cornerRadius(8)
//            .frame(width: 195, height: 255)
//            .background(Color.custWhite)
//            .padding()
//           //.padding([.top, .bottom, .leading,.trailing],10)
//            
//            HStack(){
//                Spacer()
//                Button(action: {
//                    // Action for adding item
//                }) {
//                    Image("Add")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 38, height: 38)
//                }
//                Spacer()
//            }
//            .padding(.top, -45)
//        }
//        .background(Color.custBgColor)
    }
}

#Preview {
    MainCourseCell()
}
