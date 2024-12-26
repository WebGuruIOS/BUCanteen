//
//  NotificationView.swift
//  BUCanteen
//
//  Created by Prince on 19/11/24.
//

import SwiftUI


 struct NotificationView: View {

     @State var NotificationArr:[NotificationData] = []
     
     @Environment(\.dismiss) var dismiss
     var body: some View {
        
         VStack {
             Spacer()
             HStack {
                 Button(action: {
                     dismiss()
                 }) {
                     Image("Back")
                         .resizable()
                         .foregroundColor(.custWhite)
                         .frame(width: 30, height: 30)
                 }
                 
                 Spacer()
                 
                 Text("Notification")
                     .foregroundColor(Color.white)
                     .font(.system(size: 22, weight: .medium))
                 
                 Spacer()
                 
                 // Placeholder for symmetry
                 Image(systemName: "arrow.left")
                     .foregroundColor(.clear)
             }.frame(height: 20)
             .padding()
             .background(Color.orangetopview)
             
             // Notification list
             ScrollView(.vertical, showsIndicators: false){
             LazyVStack() {
                 ForEach(NotificationArr) { notification in
                     NotificationRow(notificationText: notification.message, timeText:notification.date_time)
                 }.listStyle(PlainListStyle())
             }
             .padding(.top, 5)
         }
             
             }.onAppear{self.NotificationApi()}
             .background(Color(UIColor.systemGray6))
             .navigationBarBackButtonHidden(true)
         
     }
     
     
     func NotificationApi() {
         let userID = UserDefaults.standard.value(forKey: "userid") as? String
         let parameters:[String:Any] = ["userId": userID ?? ""]
         debugPrint("Parameters:- ",parameters)
         NotificationDataResponse.NotifiDataValue(api:StaticURL.NotificationApi, parameters:parameters) { (data) in
             if data != nil {
                 let responseCode = data?.responseCode
                 let responseText = data?.responseText
                 self.NotificationArr = data?.responseData ?? []
                 //self.MinimumOrderAmountForDelivery = cartDataArr.
                 debugPrint("DEBUG:- NotificationArr:-",self.NotificationArr )
                 switch responseCode {
                 case 1:
                     debugPrint("Sucess")
                    // ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                 case 0:
                     ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                 default:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                 }
             }
                
         }
     }
 }

 struct NotificationRow: View {
     let notificationText: String
     let timeText: String
     
     var body: some View {
         VStack(alignment: .leading, spacing: 8) {
             Text(notificationText)
                 .font(.system(size: 15, weight: .semibold))
                 .foregroundColor(.custGray2)
             
             Text(timeText)
                 .font(.system(size: 13, weight: .regular))
                 .foregroundColor(.custFontLightGray)
         }
         .padding(8)
         .background(Color.white)
         .cornerRadius(8)
         .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
     }
 }


#Preview {
    NotificationView()
}

