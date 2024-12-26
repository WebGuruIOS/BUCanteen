    //
//  CodeTestView.swift
//  BUCanteen
//
//  Created by Prince on 27/09/24.
//

//import SwiftUI
//
//struct CodeTestView: View {
//   
//}
//
//#Preview {
//    CodeTestView()
//}



/*
 import SwiftUI

 struct Order: Identifiable {
     let id = UUID()
     let date: String
     let amount: String
     let paymentMode: String
     let status: String
 }

 struct MyOrdersView: View {
     // Sample order data
     let orders = [
         Order(date: "November 14, 2024", amount: "₹1.00", paymentMode: "ccavenue", status: "Pending"),
         Order(date: "September 12, 2024", amount: "₹34.00", paymentMode: "ccavenue", status: "Cancelled")
     ]
     
     var body: some View {
         NavigationStack {
             VStack {
                 Text("My Orders")
                     .font(.title2)
                     .bold()
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Color.orange)
                     .foregroundColor(.white)
                 
                 ScrollView {
                     VStack(spacing: 12) {
                         ForEach(orders) { order in
                             NavigationLink(destination: OrderDetailsView(order: order)) {
                                 OrderRowView(order: order)
                             }
                             .buttonStyle(PlainButtonStyle()) // Removes default button animation
                         }
                     }
                     .padding()
                 }
             }
         }
     }
 }

 struct OrderRowView: View {
     let order: Order
     
     var body: some View {
         VStack(alignment: .leading, spacing: 8) {
             Text(order.date)
                 .font(.subheadline)
                 .foregroundColor(.gray)
             
             Text(order.amount)
                 .font(.headline)
             
             HStack {
                 Text("Payment Mode:")
                 Text(order.paymentMode)
                     .foregroundColor(.orange)
             }
             .font(.subheadline)
             
             HStack {
                 Text("Status:")
                 Text(order.status)
                     .foregroundColor(order.status == "Pending" ? .red : .green)
             }
             .font(.subheadline)
             
             Spacer()
         }
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.white)
         .cornerRadius(8)
         .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
     }
 }

 struct OrderDetailsView: View {
     let order: Order
     
     var body: some View {
         VStack(spacing: 20) {
             Text("Order Details")
                 .font(.title)
                 .bold()
                 .padding()
             
             Text("Date: \(order.date)")
             Text("Amount: \(order.amount)")
             Text("Payment Mode: \(order.paymentMode)")
             Text("Status: \(order.status)")
             
             Spacer()
         }
         .navigationTitle("Order Details")
         .padding()
     }
 }

 struct ContentView: View {
     var body: some View {
         MyOrdersView()
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 */
