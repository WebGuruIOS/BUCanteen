//
//  CartView.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct CartView: View {
    @State private var isNotificationView:Bool = false
    @State private var isCheckout:Bool = false
    @State var cartDataArr:[CartData] = []
    @State var SumarryCartDataArr:SummaryCartData?
    @State var totalPAyAmount:String = ""
    @State private var CartQuantity = 1
    
    var body: some View {
        VStack {
            ZStack{
                Color("headerColor")
                HStack{
                    Image("Notification")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.clear)
                    Spacer()
                    Text("My Cart")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 50)
                    Spacer()
                    Button(action: {
                        isNotificationView = true
                    }, label: {
                        Image("Notification")
                            .resizable()
                        //.scaledToFit()
                            .frame(width: 35,height: 35)
                            .padding()
                            .padding(.trailing, 10)
                            .foregroundColor(.white)
                    }).navigationDestination(isPresented: $isNotificationView) {
                        NotificationView()
                    }
                }
                // Spacer()
            }
            .frame(height: 70)
            
            // List of Cart Items
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading){
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack{
                            LazyVStack() {
                                ForEach(cartDataArr) { cartItems in
                                    CartCell(CartItems: cartItems)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                                        .padding([.leading,.trailing],16)
                                        .padding(.bottom,5)
                                }
                            }
                        }
                        .padding(.top,10)
                    }
                }
            }
            .background(Color.custBgColor)
            .listStyle(InsetListStyle())
            
            VStack {
                HStack {
                    Text("Total Pay: ₹ " + "\(totalPAyAmount)")
                        .font(.system(size: 23, weight: .medium))
                        .foregroundColor(Color.custFontGray)
                    Spacer()
                    Button(action: {
                        isCheckout = true
                    }) {
                        Text("Checkout")
                            .font(.system(size: 19, weight: .semibold))
                            .frame(width: 100, height: 57)
                        // .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.custorange)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                    } .navigationDestination(isPresented: $isCheckout) {
                        CheckoutView(paymentHtmlUrl: "")
                    }
                }.onAppear{self.SummaryCartDataApi()}
            }.onAppear{self.MyCartApi()}
                .padding()
                .background(Color.white)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: -5)
        }
    }
    
    func MyCartApi() {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let parameters:[String:Any] = ["user_id":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        CartDataResponse.CartDataValue(api:StaticURL.CartListApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.cartDataArr = data?.responseData ?? []
                //self.MinimumOrderAmountForDelivery = cartDataArr.
                debugPrint("DEBUG:- cartDataArr:-",self.cartDataArr )
                switch responseCode {
                case 1:
                    
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                   // isHome = true
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
               
        }
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
                debugPrint("DEBUG:- totalPAyAmount:-", data?.responseData ?? [] )
                switch responseCode {
                case 1:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
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


struct CartCell: View {
    
    @State private var cartQuantity = 1
    
    var CartItems: CartData
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(spacing: 10){
                AsyncImage(url: URL(string:CartItems.image ?? "")){ result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 110)
                        .cornerRadius(10)
                        .padding(.top, 10)
                      
                }

                VStack(alignment: .leading){
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(CartItems.food_item_name ?? "")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.custFontGray)
                                .multilineTextAlignment(.leading)
                                .padding(.top,10)
                            Text(CartItems.description?.html2String ?? "")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color.custGray2)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 5){
                                Text(CartItems.price_for_canteen ?? "")
                                    .font(.system(size: 19, weight: .bold))
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
                        }
                        .padding(.trailing,10)
                        .padding(.bottom, 30)
                    }
                    CartQuantityVieww(CartItems: CartItems, quantity: $cartQuantity)
                }
            }
            
            .background(Color("cartButton"))
            .cornerRadius(12)
            .padding([.leading,.trailing,.bottom],10)
        }
    }
}


struct CartQuantityVieww: View {
    
    var CartItems: CartData
    @Binding var quantity: Int
    
    var body: some View {
        HStack(alignment:.top) {
            
         
            Button(action: {
                if quantity > 1 {
                    quantity -= 1
                }
            }) {
                Image(.minus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
            }
            Text(CartItems.quantity ?? "")
                .font(.system(size: 18))
            Button(action: {
                quantity += 1
            }) {
                Image(.plus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
            }
        }
    }
}



#Preview {
    CartView()
}


extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}


extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
