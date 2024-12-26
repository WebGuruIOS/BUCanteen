//
//  WishlistView.swift
//  BUCanteen
//
//  Created by Prince on 26/09/24.
//

import SwiftUI

import SwiftUI

struct WishlistView: View {
    @Environment(\.dismiss) var dismiss
    @State var menuItems: [MenuItem] = [
        MenuItem(name: "Extra Rice", price: 10, quantity: 1),
        MenuItem(name: "Special Non Veg Thali", price: 120, quantity: 1),
        MenuItem(name: "Fish Curry", price: 80, quantity: 1),
        MenuItem(name: "Chicken Curry", price: 100, quantity: 1),
        MenuItem(name: "Omelet", price: 15, quantity: 1)
    ]

    var body: some View {
        VStack{
            Spacer()
        HStack(alignment:.center, spacing: 25){
            Button(action: {
                //Buttom Action
                dismiss()
            }, label: {
                Image("Back")
                    .resizable()
                    .foregroundColor(.custWhite)
                    .frame(width: 35, height: 35)
            })
            .padding()
            Spacer()
            Text("Wishlist")
                .foregroundColor(Color.white)
                .font(.system(size: 22, weight: .medium))
               // .padding(.leading, 25)
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
            ForEach($menuItems) { $item in
                HStack(spacing: 10) {
                    Image("aloo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(5)
                        .padding([.trailing], 15)
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.custFontGray)
                        Text("₹ \(item.price)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.priceText)
                        Text("QTY: \(item.quantity)")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(Color.custGray2)
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
                        .padding()
                        Button(action: {
                            
                        }, label: {
                            Image("Cart1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 19)
                        })
                        // .padding([.leading,.top],10)
                        .padding()
                    }
                    .padding()
                    //                        VStack {
                    //                            Button(action: {
                    //                                if item.quantity > 1 {
                    //                                    item.quantity -= 1
                    //                                } else {
                    //                                    menuItems.removeAll { $0.id == item.id }
                    //                                }
                    //                            }) {
                    //                                Image(systemName: "minus.circle.fill")
                    //                                    .foregroundColor(.red)
                    //                            }
                    //
                    //
                    //
                    //                            Button(action: {
                    //                                item.quantity += 1
                    //                            }) {
                    //                                Image(systemName: "plus.circle.fill")
                    //                                    .foregroundColor(.green)
                    //                            }
                    //                        }
                }
                .background(Color.custWhite)
                .cornerRadius(10)
                //.padding()
            }
            .padding([.leading, .trailing], 10)
            //.onDelete(perform: delete)
        }
        .background(Color.custBgColor)
        .navigationBarBackButtonHidden(true)
    }
    }

    func delete(at offsets: IndexSet) {
        menuItems.remove(atOffsets: offsets)
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var quantity: Int
}




#Preview {
    WishlistView()
}
