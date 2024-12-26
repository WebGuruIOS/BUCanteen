//
//  OrderDetailsView.swift
//  BUCanteen
//
//  Created by Prince on 01/10/24.
//

import SwiftUI

struct OrderDetailsView: View {
    @State var OrderDetailsDataArr:OrderDetailsData?
    @State var totalPAyAmount:String = ""
    //@State var orderID:String = ""
    @State var OrderDate:String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            // Header
            Spacer()
            HStack(alignment:.center, spacing: 2){
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
                Text("Order Details")
                    .foregroundColor(Color.white)
                    .font(.system(size: 22, weight: .medium))
                
                Spacer()
                
                Button(action: {
                    //Buttom Action
                }, label: {
                    Image("")
                        .resizable()
                        .foregroundColor(.custWhite)
                        .frame(width: 35, height: 35)
                    
                })
                .padding(.trailing, 15)
                .padding()
                
            }
            .background(Color.orangetopview)
            
            // Order ID and Date Section
            HStack(spacing: 5) {
                Text("Order ID - OD1236547658A")
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity)
                Divider()
                
              
                
                Text(OrderDate)
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 35)
           // .padding()
            .background(Color.white)
           
            .padding(.top, -10)
            VStack(alignment: .leading, spacing: 10){
                ScrollView(.vertical, showsIndicators: false){
                    // Items Section
                    VStack(spacing: 10) {
                        OrderItemView(itemName: "Special Non Veg Thali", price: "₹120", quantity: "QTY: 1", imageName: "food1")
                        OrderItemView(itemName: "Extra Rice", price: "₹10", quantity: "QTY: 1", imageName: "food2")
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    //.padding(.top, 10)
                    
                    // Status Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Status")
                            .font(.headline)
                        Text("Pending")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                        Image("BaseLine")
                            .resizable()
                            .frame(width: 338, height: 2)
                            HStack(){
                                Spacer()
                                Button(action: {
                                    // Action for adding item
                                }) {
                                    Text("Cancel")
                                        .foregroundColor(.red)
                                }
                                Spacer()
                            }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    //.padding(.top, 10)
                    
                    // Serving Mode Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Serving Mode")
                             .font(.headline)
                        Text("Delivery: Block-A, Building No.: 5, Room Number-6")
                            .lineLimit(3)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    // .padding(.horizontal)
                   // .padding(.top, 10)
                    
                    // Price Details Section
                    VStack(alignment: .leading, spacing: 10) {
                        let dataCount = String(OrderDetailsDataArr?.orderitem.count ?? 0)
                        HStack(spacing: 0){
                            Text("Price Details (")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text(dataCount)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("\(dataCount)" + " Items)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        HStack {
                            Text("Sub Total")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                            Spacer()
                            Text("₹ " + totalPAyAmount)
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                        }
                        HStack {
                            Text("Delivery Charge")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                            Spacer()
                            Text("₹ 0.00")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                        }
                        HStack {
                            Text("GST")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                            Spacer()
                            Text("₹ 0.00")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                        }
                        HStack {
                            Text("Discount")
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                            Spacer()
                            Text("₹ " + (OrderDetailsDataArr?.discount_amount ?? "0.00") )
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 15, weight: .regular))
                                //.foregroundColor(.red)
                        }
                        HStack {
                            Text("Total Amount")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                            Spacer()
                            Text("₹ " + totalPAyAmount)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                //.foregroundColor(.red)
                        }
                        
                    }.onAppear{self.OrderDetailsApi()}
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                
            }
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        
    }
    func OrderDetailsApi() {
      //  let userID = UserDefaults.standard.value(forKey: "userid") as! String
        let parameters:[String:Any] = ["user_id":"27","order_id":"BWUPP172613673960"]
        debugPrint("Parameters:- ",parameters)
        OrderDetailsDataResponse.OrderDetails(api:StaticURL.ordersDetailsApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.OrderDetailsDataArr = data?.responseData
                self.totalPAyAmount = data?.responseData?.order_total ?? ""
               // self.orderID = data?.responseData?.order_id ?? ""
                
                
                
                let strDate = data?.responseData?.created_at ?? ""
                debugPrint(strDate)
                //Date Formatter
                var formattedDate: String {
                    let isoFormatter = ISO8601DateFormatter()
                    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    
                    if let date = isoFormatter.date(from: strDate) {
                        let outputFormatter = DateFormatter()
                        outputFormatter.dateFormat = "MMMM d, yyyy"
                        return outputFormatter.string(from: date)
                    } else {
                        return "Invalid date"
                    }
                }
                
                
                self.OrderDate = formattedDate
                
                debugPrint("DEBUG:- totalPAyAmount:-", data?.responseData ?? [] )
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


// Reusable component for each order item
struct OrderItemView: View {
    var itemName: String
    var price: String
    var quantity: String
    var imageName: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName) // Replace with actual images
                .resizable()
                .frame(width: 106, height: 106)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(itemName)
                    .font(.headline)
                Text("Maecenas pharetra lacus")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(quantity)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(price)
                .font(.headline)
                .foregroundColor(.red)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        
        
        //.frame(width: 371,height: 150)
//        .background(Color.white)
//        .cornerRadius(10)
//        //.shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
//        .padding(.bottom,5)
    }
    
    
}

#Preview {
    OrderDetailsView()
}
