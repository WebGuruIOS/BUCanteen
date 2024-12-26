//
//  CheckoutView.swift
//  BUCanteen
//
//  Created by Prince on 01/10/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @State private var selectedServingMode = "Delivery"
    @State private var selectedPaymentOption = "Points Balance"
    @State private var pointDataArr:[pointAllData]?
    @State private var pointBalance = ""
    @State private var userAddress = ""
    @State private var isProceedTopay:Bool = false
    @State var SumarryCartDataArr:SummaryCartData?
    @State var totalPAyAmount:String = ""
    @State private var isPointBalance = false
    @State private var isOnlinePAyment = false
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedTimeSlot: String? = nil
    @State private var couponCode: String = ""
    @State var timeSlotsArr:[timeSlotDataList] = []
    @State var SlotsArr:[String] = []
    
    @State var discountAmount:String = ""
    @State var total_tax_amount:String = ""
    @State var block_name:String = ""
    @State var floor_name:String = ""
    @State var room_no:String = ""
    @State var paymentHtmlUrl:String
    
    
    @State private var ISPaymentView:Bool = false
    /*
     "delivery_mode":"delivery",
     "payment_method":"both",
     */
    
    var body: some View {
        VStack(){
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
                Text("Checkout")
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
            // Serving Mode Section
            VStack(alignment: .leading, spacing: 5) {
                
                let selectedMood = UserDefaults.standard.value(forKey: "selectedMood") as? String
                if selectedMood == "Canteen"{
                    Text("Serve in Canteen")
                        .font(.headline)
                        .padding(.leading, -170)
                }else{
                    Text("Delivery at:")
                        .font(.headline)
                        .padding(.leading, -10)
                    Text(userAddress)
                        .foregroundColor(Color.custFontGray)
                        .font(.system(size: 15, weight: .regular))
                        .padding(.leading, -10)
                }
               
            }.onAppear{self.ProfileApi()}
                
            .frame(width: 325)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Payment Option Section
            VStack(alignment: .leading, spacing: 10) {
               
                Text("Payment Option")
                    .font(.headline)
                    .padding(.leading, 95)
                
                
                // Checkbox for payment
                
                HStack(){
                    Button(action: {
                        if pointBalance <= "1"{
                        
                        }else{
                            isPointBalance.toggle()
                            isOnlinePAyment = false
                        }
                        
                    }, label: {
                        if isPointBalance{
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                        }else{
                            Image("uncheck")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    })
                    if pointBalance <= "1"{
                        
                        Text("Point Balance")
                            .foregroundColor(Color.custFontGray)
                            .font(.system(size: 18, weight: .regular))
                    }else{
                        Text("Point Balance")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .regular))
                    }
                    //Text("Point Balance")
                    Spacer()
                    Text(pointBalance)
                }.onAppear{self.PointApi()}
                
                
                HStack(){
                    Button(action: {
                        isOnlinePAyment.toggle()
                        isPointBalance = false
                    }, label: {
                        if isOnlinePAyment{
                            Image("check")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                        }else{
                            Image("uncheck")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                                
                        }
                    })
                    Text("Online Payment")
                    Spacer()
                    VStack{
                        Image("online-payment")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding(6)
                    }
                    .background(Color.custorange)
                    .cornerRadius(45)
                    
                }
            }
            .frame(width: 325)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
                
                VStack(spacing: 20) {
                    // Title
                    Text("Select Timeslot")
                        .font(.headline)
                        .foregroundColor(.black)
                    // Time Slots
                    ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 8) {
                        ForEach(SlotsArr, id: \.self) { time in
                            Button(action: {
                                selectedTimeSlot = time
                                debugPrint(selectedTimeSlot ?? "")
                            }) {
                                Text(formatTime(time))
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(8)
                                    .frame(height: 40)
                                    .background(selectedTimeSlot == time ? Color.orange : Color.clear)
                                    .foregroundColor(selectedTimeSlot == time ? .white : .orange)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.orange, lineWidth: 1)
                                    )
                                    .cornerRadius(20)
                            }
                        }
                       }.onAppear{self.timeSlotApi()}
                    }
               }
                .frame(width: 325)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                // View Offer Button
                Button(action: {
                    // Action for today's offer
                }) {
                    Text("View Today's Offer")
                        .padding(10)
                       // .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(45)
                }
                .padding(.horizontal)
                
                // Coupon Code Entry
                HStack(spacing:5) {
                    TextField("Enter coupon code", text: $couponCode)
                        .padding()
                        .frame(height: 50)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.custFontLightGray, lineWidth: 1)
                        )
                        .cornerRadius(20)
                    
                    Button(action: {
                        // Action for applying coupon
                    }) {
                        Text("Apply")
                            .padding(25)
                            .frame(height: 50)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(45)
                    }
                }
                .padding(.horizontal)
                
            // Price Details Section
            VStack(alignment: .leading, spacing: 10) {
                let dataCount = String(SumarryCartDataArr?.cart_items?.count ?? 0)
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
                    Text("₹ " + (SumarryCartDataArr?.discount ?? "0.00") )
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
                
            }
            .frame(width: 325)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            
            //Spacer()
                VStack{
                    
                }.frame(height: 50)
            // Proceed to Pay Button
                Button(action: {
                    // Proceed to pay action
                    onlineApi()
                    
                    // checkItemQTYApi()
                    
                    
                
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    }) {
                Text("Proceed to Pay")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.custorange)
                    .cornerRadius(25)
                    .padding(.horizontal)
            }
            .navigationDestination(isPresented: $ISPaymentView) {
                PaymentView(paymentHtmlUrl: paymentHtmlUrl)
                //PaymentView()
            }
            .padding()
            //.padding(.bottom,25)
            }.onAppear{self.SummaryCartDataApi()}
        .background(Color(.systemGray6))
        .padding(.bottom)
        .edgesIgnoringSafeArea(.top)
    }
        .navigationBarBackButtonHidden(true)
       
    }
    
    
    func SummaryCartDataApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let selectedMood = UserDefaults.standard.value(forKey: "selectedMood") as? String
        let parameters:[String:Any] = ["user_id": userID ?? "", "delivery_mode":selectedMood ?? ""]
        debugPrint("Parameters:- ",parameters)
        SummaryCartDataResponse.SummaryCartDataValue(api:StaticURL.getCartSummaryApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                
                self.totalPAyAmount = data?.responseData?.order_total ?? ""
                self.discountAmount = data?.responseData?.discount ?? ""
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
    
    func PointApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        PointDataResponse.PointAllData(api:StaticURL.transactionHistoryApi, parameters:parameters) { (data) in
            if data != nil {
                self.pointDataArr = data?.responseData?.data
                pointBalance = pointDataArr?[0].balance_amount ?? ""
            }
        }
    }
    
    func ProfileApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        ProfileDataResponse.ProfileUserData(api:StaticURL.getProfileApi, parameters:parameters) { (data) in
            if data != nil {
                self.room_no = ", Room Number- " +  (data?.responseData?.roomNo ?? "")
                self.block_name = data?.responseData?.blockName ?? ""
                let building = "Building No.: " + (data?.responseData?.buildingId ?? "")
                self.floor_name = ", Floor: " + (data?.responseData?.floorName ?? "")
               // let department = data?.responseData?.department ?? ""
                let compAddress = building + floor_name + room_no
                debugPrint(compAddress)
                self.userAddress = compAddress
               
            }
        }
    }
    
    func timeSlotApi() {
        let selectedType = UserDefaults.standard.value(forKey: "selectedType") as? String
        let parameters:[String:Any] = ["type":selectedType ?? ""]
        debugPrint("Parameters:- ",parameters)
        timeSlotResponse.timeSlot(api:StaticURL.getTimeSlotApi, parameters:parameters) { (data) in
            if data != nil {
                self.timeSlotsArr = data?.responseData ?? []
                self.SlotsArr = data?.responseData.compactMap{$0.timeSlot} ?? []
                debugPrint(self.SlotsArr)
               
            }
        }
    }
    
    func checkItemQTYApi() {
        let selectedType = UserDefaults.standard.value(forKey: "selectedType") as? String
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["userId": userID ?? "",
                                       "orderFor":selectedType ?? ""]
        debugPrint("Parameters:- ",parameters)
        timeSlotResponse.timeSlot(api:StaticURL.CheckItemQntApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                switch responseCode {
                case 1:
                    debugPrint("")
                    isProceedTopay = true
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
    
    func orderPlaceApi() {
       // let selectedType = UserDefaults.standard.value(forKey: "selectedType") as? String
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let userName = UserDefaults.standard.value(forKey: "userName") as? String
        let userPhone = UserDefaults.standard.value(forKey: "userPhone") as? String
        
       // let selectedMood = UserDefaults.standard.value(forKey: "selectedMood") as? String
        let parameters:[String:Any] = ["user_id": userID ?? "",
                                       "delivery_mode":"delivery",
                                       "payment_method":"both",
                                       "discount_total":discountAmount,
                                       "coupon":couponCode,
                                       "user_name": userName ?? "",
                                       "mobile_number":userPhone ?? "",
                                       "block_name": block_name,
                                       "floor_name" : floor_name,
                                       "room_no":room_no,
                                       "delivery_time" :formatTime(selectedTimeSlot ?? ""),
                                       "total_tax_amount":totalPAyAmount,
                                       "orderFor":""]
        debugPrint("Parameters:- ",parameters)
        PlaceOrderResponse.placeOrder(api:StaticURL.placeOrderApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                switch responseCode {
                case 1:
                    debugPrint("")
                    isProceedTopay = true
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
               
            }
        }
    }
    
    
    func formatTime(_ time: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm:ss" // Input format

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "hh:mm a" // Output format

        if let date = inputFormatter.date(from: time) {
            return outputFormatter.string(from: date).uppercased() // Converts "am/pm" to "AM/PM"
        } else {
            return time // Return the original string if parsing fails
        }
    }
    
    
    func onlineApi() {
        let selectedType = UserDefaults.standard.value(forKey: "selectedType") as? String
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["orderRowId": "2021",
                                       "orderId": "BWUPP173387711040",
                                       "userId": "27",
                                       "walletPoint":"0"]
        debugPrint("Parameters:- ",parameters)
        OnlinePaymentResponse.OnlinePayment(api:StaticURL.paymentOnlineApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                let resData = data?.responseData ?? ""
                self.paymentHtmlUrl = resData
                debugPrint("paymentHtmlUrl:- ",paymentHtmlUrl ?? "")
                switch responseCode {
                case 1:
                    if paymentHtmlUrl != ""{
                        ISPaymentView = true
                    }
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

struct RadioButtonRow: View {
    var title: String
    @Binding var isSelected: String
    var option: String
    var extraText: String? = nil
    var iconName: String? = nil
    
    var body: some View {
        HStack {
            Image(systemName: isSelected == option ? "largecircle.fill.circle" : "circle")
                .foregroundColor(isSelected == option ? .red : .gray)
                .onTapGesture {
                    isSelected = option
                }
            
            Text(title)
                .foregroundColor(.black)
                .onTapGesture {
                    isSelected = option
                }
            
            Spacer()
            
            if let extra = extraText {
                Text(extra)
                    .foregroundColor(.gray)
            }
            
            if let icon = iconName {
                Image(systemName: icon)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 5)
    }
}


#Preview {
    CheckoutView(paymentHtmlUrl: "")
}
