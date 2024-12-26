//
//  OrderListView.swift
//  BUCanteen
//
//  Created by Prince on 01/10/24.
//

import SwiftUI

struct OrderListView: View {
    
    
    @State private var isOrderDetails:Bool = false
    
//    @State private var prodID:String = ""
//    @State private var date:String = ""
//    @State private var amount:String = ""
//    @State private var paymentMode:String = ""
//    @State private var statusColor:String = ""
    //@State  var prodID: String
    @State var ordersDataArr: [orderListData] = []
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(){
            Spacer()
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image("Back")
                        .resizable()
                        .foregroundColor(.custWhite)
                        .frame(width: 25, height: 25)
                })
                .padding(.leading)
                Spacer()
                Text("My Orders")
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
                .padding(6)
            }
            .background(Color.orangetopview)
          
            VStack(){
            // List of orders
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack() {
                    ForEach(ordersDataArr) { payment in
                        NavigationLink(destination: OrderDetailsView(), label: {
                            PaymentRow(payment: payment)
                        })
                    }
                    .padding(.top, 5)
                }
            }
            .padding(.top, 15)
            .background(Color(.systemGray6))
          }
            
        }.onAppear{self.MyOrderApi()}
        .navigationBarBackButtonHidden(true)
    }
    
    
    func MyOrderApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        OrderListDataResponse.orderListData(api:StaticURL.getOrdersApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.ordersDataArr = data?.responseData?.data ?? []
                debugPrint("DEBUG:- ordersDataArr:-",self.ordersDataArr )
                switch responseCode {
                case 1:
                    debugPrint("")
                 //   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
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
    OrderListView()
}


struct PaymentRow: View {
    var payment: orderListData

    var body: some View {
        VStack(alignment: .leading) {
            
            let strDate = payment.created_at ?? ""
            //Date Formatter
            var formattedDate: String {
                let isoFormatter = ISO8601DateFormatter()
                isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                
                if let date = isoFormatter.date(from: strDate) {
                    let outputFormatter = DateFormatter()
                    outputFormatter.dateFormat = "MMMM d, yyyy" // Example: July 17, 2024
                    return outputFormatter.string(from: date)
                } else {
                    return "Invalid date"
                }
            }
            
            Text(formattedDate)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.orangetopview)
            
            HStack {
                Image("BaseLine")
                    .resizable()
                    .frame(width: 295, height: 1)
                // Spacer()
                Image("leftAerrow")
                    .resizable()
                    .frame(width: 26, height: 26)
                
            }
            .padding(.vertical, -15)
            // .frame(height: 50)
            VStack(alignment: .leading,spacing: 8){
            Text("₹ " + "\(payment.order_net_total ?? "")")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black)
            HStack{
                Text("Payment Mood: ")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.custFontLightGray)
                
                Text(payment.payment_mode ?? "")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
            }
            HStack{
                Text("Status: ")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.custFontLightGray)
                let statusCode = (payment.status ?? "")
                
                if statusCode == "1"{
                    Text("Pending")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.custorange)
                }else if statusCode == "2"{
                    Text("Delivered")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.green)
                }else if statusCode == "3"{
                    Text("Cancelled")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.red)
                }else{
                    Text("Rejected")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.red)
                }
             }
           }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
