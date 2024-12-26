//
//  WishLIstCell.swift
//  BUCanteen
//
//  Created by Prince on 26/09/24.
//

import SwiftUI

struct WishLIstCell: View {
    @State private var cartQuantity = 1
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 10){
                Image("aloo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding([.top,.leading],10)
                  
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Extra Rice")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.custFontGray)
                                .multilineTextAlignment(.leading)
                                .padding(.top,10)
                            Text("Maecenas pharetra lacus")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color.custGray2)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 5){
                                Text("₹ 660.00")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color.priceText)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 12))
//                                Text("₹ 550.00")
//                                    .fontWeight(.regular)
//                                    .foregroundColor(Color.orange)
//                                    .multilineTextAlignment(.leading)
//                                    .font(.system(size: 18))
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Button(action: {
                                
                            }, label: {
                                Image("delete")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21)
                            })
                            Button(action: {
                                
                            }, label: {
                                Image("Cart1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 19)
                            })
                        }
                        .padding(.trailing,10)
                        .padding(.top,16)
                    }
                    Text("Qty: 1")
                        .foregroundColor(.orangeCust)
                       // .frame(width: 35, height: 35)
                   // CartQuantityVieww(quantity: $cartQuantity)
                }
            }
            
            .background(Color("cartButton"))
            .cornerRadius(12)
            .padding([.leading,.trailing,.bottom],10)
        }
        
       
       // .background(.red)
       // .padding([.leading,.trailing,.top,.bottom],10)
    }
}

#Preview {
    WishLIstCell()
}
