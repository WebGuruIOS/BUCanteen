//
//  MyPointsView.swift
//  BUCanteen
//
//  Created by Prince on 01/10/24.
//

import SwiftUI

struct MyPointsView: View {
    @State private var selectedAmount = "₹ 100"
    @State private var pointDataArr:[pointAllData]?
    @State private var pointBalance = ""
                    
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
                Text("My Points")
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
            
            ScrollView(.vertical, showsIndicators: false){
            // Points Balance and Recharge Section
            VStack(spacing: 10) {
              //  let pointBalance = TransactionRow.init(transaction: pointBalance)
                Text("Points Balance: " + "\(pointBalance)")
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 25, weight: .medium))
                  
                Text("Recharge Point")
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 18, weight: .regular))
                
                HStack() {
                    // Recharge Amount Dropdown
                    Menu {
                        Button("50") { selectedAmount = "₹ 50" }
                        Button("100") { selectedAmount = "₹ 100" }
                        Button("150") { selectedAmount = "₹ 150" }
                    } label: {
                        HStack(spacing: 35) {
                            Text(selectedAmount)
                                .foregroundColor(Color.custFontGray)
                                .font(.system(size: 20, weight: .medium))
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                    }
                    
                    
                    // Recharge Button
                    Button(action: {
                        // Recharge action
                    }) {
                        Text("Recharge")
                            .font(.system(size: 19, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.custorange)
                            .cornerRadius(35)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            //.background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Transaction List Section
            VStack(alignment: .leading) {
                Text("Transaction List")
                    .foregroundColor(Color.custFontGray)
                    .font(.system(size: 22, weight: .medium))
                    .padding(.bottom, 10)
                
                VStack{
                    LazyVStack() {
                        ForEach(pointDataArr ?? []) { pointItems in
                            TransactionRow(transaction: pointItems)
                        }
                    }
                }.onAppear{self.PointApi()}
                .padding(.top,10)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
            
          }
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
    }
        
    
    func PointApi() {
       // let userID = UserDefaults.standard.value(forKey: "userid") as! String
        let parameters:[String:Any] = ["user_id": "27"]
        debugPrint("Parameters:- ",parameters)
        PointDataResponse.PointAllData(api:StaticURL.transactionHistoryApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.pointDataArr = data?.responseData?.data
                pointBalance = pointDataArr?[0].balance_amount ?? ""
                debugPrint("DEBUG:- pointDataArr:-",self.pointDataArr ?? [])
                switch responseCode {
                case 1:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
               
        }
    }
    
    
}


// Transaction Row Component
struct TransactionRow: View {

//     var isPositive: Bool
    
    var transaction: pointAllData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack() {
                Text(transaction.transaction_comment ?? "")
                    .foregroundColor(Color.custFontLightGray)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
               // Text(isPositive ? "+\(amount)" : "-\(amount)")
                let trasactionType = transaction.transaction_type
                
                if trasactionType == "credit"{
                    Text(transaction.transaction_amount ?? "")
                        .foregroundColor(Color.green)
                        .font(.system(size: 16, weight: .semibold))
                }else{
                    Text(transaction.transaction_amount ?? "")
                        .foregroundColor(Color.red)
                        .font(.system(size: 16, weight: .semibold))
                }
            
                   // .foregroundColor(isPositive ? .green : .red)
                   
            }
            HStack() {
                Text("Date: ")
                    .foregroundColor(Color.custFontLightGray)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                
                
                let strDate = transaction.created_at ?? ""
                //Date Formatter
                var formattedDate: String {
                    let isoFormatter = ISO8601DateFormatter()
                    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    
                    if let date = isoFormatter.date(from: strDate) {
                        let outputFormatter = DateFormatter()
                        outputFormatter.dateFormat = "MMMM d, yyyy h:mm a" // Example: July 17, 2024
                        return outputFormatter.string(from: date)
                    } else {
                        return "Invalid date"
                    }
                }
                
                Text(formattedDate)
                    .foregroundColor(Color.custFontLightGray)
                    .font(.system(size: 16, weight: .semibold))
            }
            HStack() {
                Text("Transaction ID: ")
                    .foregroundColor(Color.custFontLightGray)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                
                Text(transaction.transaction_id ?? "")
                    .foregroundColor(Color.custFontLightGray)
                    .font(.system(size: 16, weight: .semibold))
            }
            Divider()
          
            
           
               
        }
        .padding(.top, 10)
        .navigationBarBackButtonHidden(true)
    }
      
}

#Preview {
    MyPointsView()
}


