//
//  HomePageView.swift
//  BUCanteen
//
//  Created by Prince on 26/09/24.
//

import SwiftUI



struct HomePageView: View {
    
    
    @State var selectedMeal: String = "lunch" // Default selection
    @State var mainCourseArr:[mainCourseData] = []
    @State var additionalItemArr:[additionalItemData] = []
    @State var bannerArr:[bannerData] = []
    @State var showPopUp:Bool = false
    @State var selectedMode: String = "Canteen" // Default selection
   
    
    var body: some View {
        ZStack{
            if showPopUp{
                VStack {
                    // Header Image
                    
                    HStack(alignment:.center, spacing: 25){
                        Image("Logo_1")
                            .resizable()
                            .frame(width: 86, height:  47)
                            .padding()
                        
                        Spacer()

                        Button(action: {

                        
                        }, label: {
                            HStack{
                                Image("Logo_1")
                                    .resizable()
                                    .frame(width: 20, height:  20)
                                Text(selectedMode)
                                    .foregroundColor(Color.orangetopview)
                                    .font(.system(size: 18, weight: .medium))
                                    
                            }
                            .padding(6)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.orangeCust, lineWidth: 1.5)
                            )
                        })
                        .padding(.trailing, -10)

                        Button(action: {
                            //Buttom Action
                        }, label: {
                            Image("Notification")
                                .resizable()
                                .foregroundColor(.custorange)
                                .frame(width: 35, height: 35)
                            
                        })
                        .padding(.trailing, 15)
                       // .padding()
                        
                        
                        
                    }
                    ScrollView(.vertical, showsIndicators: false){
                        
                        SliderView(bannerData: bannerArr)
//                        Image("Food") // Replace with your image name
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 220)
//                            .cornerRadius(15)
//                            .padding()
                        // Today's Meal Section
                        Text("Today's Meal")
                            .foregroundColor(.custBlack1)
                            .font(.system(size: 25, weight: .semibold))
                            .padding(.top, 10)
                        
                        // Meal Selection
                        
                        
                        HStack(spacing: 16) {
                            // Lunch Button
                            Button(action: {
                                selectedMeal = "lunch"
                                let type = "Lunch"
                                UserDefaults.standard.setValue(type, forKey: "selectedType")
                                self.todayMenuApi(selectedType: selectedMeal)
                            }) {
                                Text("Lunch")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(selectedMeal == "lunch" ? .black : .red)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .frame(width: 154, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(selectedMeal == "lunch" ? Color.yellow : Color.clear)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.red, lineWidth: selectedMeal == "lunch" ? 0 : 2)
                                    )
                            }
                            
                            // Dinner Button
                            Button(action: {
                                selectedMeal = "dinner"
                                let type = "Dinner"
                                UserDefaults.standard.setValue(type, forKey: "selectedType")
                                self.todayMenuApi(selectedType: selectedMeal)
                            }) {
                                Text("Dinner")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(selectedMeal == "dinner" ? .black : .red)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .frame(width: 154, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(selectedMeal == "dinner" ? Color.yellow : Color.clear)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.red, lineWidth: selectedMeal == "dinner" ? 0 : 2)
                                    )
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Main Course")
                                .foregroundColor(.custBlack1)
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8){
                                    LazyHStack() {
                                        ForEach(mainCourseArr) { item in
                                            MainCourseCell1(foodData: item, selectedMeal: $selectedMeal)
                                        }
                                    }
                                    .padding()
                                }
                            }
                            Text("Additional Items")
                                .foregroundColor(.custBlack1)
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8){
                                    //
                                    LazyHStack() {
                                        ForEach(additionalItemArr) { item in
                                            AdditionalItemsCell1(foodData: item, selectedMeal: $selectedMeal)
                                        }
                                        //.frame(width: 140, height: 300)
                                    }
                                    
                                    .padding()
                                }
                            }
                            
                        }
                        
                    }.onAppear{self.todayMenuApi(selectedType: selectedMeal)}
                }
                .background(Color.custBgColor)
                .navigationBarBackButtonHidden(true)
                NewCodeTestView(selectedType: $selectedMode, showPopUp: $showPopUp)
            } else{
                VStack {
                    // Header Image
                    
                    HStack(alignment:.center, spacing: 25){
                        Image("Logo_1")
                            .resizable()
                            .frame(width: 86, height:  47)
                            .padding()
                        
                        Spacer()

                        Button(action: {
                            showPopUp.toggle()
                        
                        }, label: {
                            HStack{
                                Image("Logo_1")
                                    .resizable()
                                    .frame(width: 20, height:  20)
                                Text(selectedMode)
                                    .foregroundColor(Color.orangetopview)
                                    .font(.system(size: 18, weight: .medium))
                                    
                            }
                            .padding(6)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.orangeCust, lineWidth: 1.5)
                            )
                        })
                        .padding(.trailing, -10)

                        Button(action: {
                            //Buttom Action
                        }, label: {
                            Image("Notification")
                                .resizable()
                                .foregroundColor(.custorange)
                                .frame(width: 35, height: 35)
                            
                        })
                        .padding(.trailing, 15)
                       // .padding()
                        
                        
                        
                    }
                    ScrollView(.vertical, showsIndicators: false){
                        
                        
                        SliderView(bannerData: bannerArr)
                        
//                        Image("Food") // Replace with your image name
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 220)
//                            .cornerRadius(15)
//                            .padding()
                        // Today's Meal Section
                        Text("Today's Meal")
                            .foregroundColor(.custBlack1)
                            .font(.system(size: 25, weight: .semibold))
                            .padding(.top, 10)
                        
                        // Meal Selection
                        
                        
                        HStack(spacing: 16) {
                            // Lunch Button
                            Button(action: {
                                selectedMeal = "lunch"
                                self.todayMenuApi(selectedType: selectedMeal)
                            }) {
                                Text("Lunch")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(selectedMeal == "lunch" ? .black : .red)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .frame(width: 154, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(selectedMeal == "lunch" ? Color.yellow : Color.clear)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.red, lineWidth: selectedMeal == "lunch" ? 0 : 2)
                                    )
                            }
                            
                            // Dinner Button
                            Button(action: {
                                selectedMeal = "dinner"
                                self.todayMenuApi(selectedType: selectedMeal)
                            }) {
                                Text("Dinner")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(selectedMeal == "dinner" ? .black : .red)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .frame(width: 154, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(selectedMeal == "dinner" ? Color.yellow : Color.clear)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.red, lineWidth: selectedMeal == "dinner" ? 0 : 2)
                                    )
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Main Course")
                                .foregroundColor(.custBlack1)
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8){
                                    
                                    LazyHStack() {
                                        ForEach(mainCourseArr) { item in
                                            MainCourseCell1(foodData: item,selectedMeal: $selectedMeal)
                                        }
                                    }
                                    .padding()
                                }
                            }
                            Text("Additional Items")
                                .foregroundColor(.custBlack1)
                                .font(.system(size: 25, weight: .semibold))
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8){
                                    //
                                    LazyHStack() {
                                        ForEach(additionalItemArr) { item in
                                            AdditionalItemsCell1(foodData: item, selectedMeal: $selectedMeal)
                                        }
                                        //.frame(width: 140, height: 300)
                                    }
                                    
                                    .padding()
                                }
                            }
                            
                        }
                        
                    }.onAppear{self.todayMenuApi(selectedType: selectedMeal)}
                }
                .background(Color.custBgColor)
                .navigationBarBackButtonHidden(true)
            }
            
           
            
        }
    }
    
    //MARK: - Home Api
    func todayMenuApi(selectedType:String) {
        let userID = UserDefaults.standard.value(forKey: "userid") as? String
        let selectedMood = UserDefaults.standard.value(forKey: "selectedMood") as? String
        let parameters:[String:Any] = [ "availableAt": selectedType,
                                        "mode":selectedMood ?? "",
                                        "userId":userID ?? ""]
        debugPrint("Parameters:- ",parameters)
        HomeDataResponse.homeData(api:StaticURL.todayMenuApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
                self.mainCourseArr = data?.responseData?.mainCourse ?? []
                self.additionalItemArr = data?.responseData?.additionalItem ?? []
                self.bannerArr = data?.responseData?.Banner ?? []
                debugPrint("DEBUG:- mainCourseArr:-",self.mainCourseArr )
                debugPrint("DEBUG:- additionalItemArr:-",self.additionalItemArr )
                
                let type = "Lunch"
                UserDefaults.standard.setValue(type, forKey: "selectedType")
                
                switch responseCode {
                case 1:
                    debugPrint("")
                   // ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                case 0:
                    ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                default:
                   ApiService.shared.showAlert(title: "", msg: responseText ?? "")
                }
            }
               
        }
    }
    
    //MARK: - Add to cart Api
  
}


#Preview {
    HomePageView()
}

struct MainCourseCell1: View {
    
    var foodData:mainCourseData
    @Binding var selectedMeal:String
    
    var body: some View {
      
        VStack(alignment: .leading, spacing: 8) {
            
            // Food Image
            AsyncImage(url: URL(string:foodData.image ?? "")){ result in
                result.image?
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                    .cornerRadius(1)
                    .padding([.top, .bottom], 10)
                    .padding(-10)
            }
            
            // Food Details
            VStack(alignment: .leading, spacing: 4) {
                Text(foodData.foodItemName ?? "")
                    .font(.headline)
                
                Text(foodData.description?.html2String ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            // Price and Quantity
            Text(foodData.priceForCanteen ?? "")
                .font(.title3)
                .foregroundColor(.red)
                .padding(.top, -15)
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
                        
                        debugPrint(foodData.foodId ?? 0)
                        
                       // let foodId = foodData.foodId
                        let strFoodId = String(foodData.foodId ?? 0)
                        addToCartApi(prodId:strFoodId)
                        
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
        .frame(width: 160)
        

    }
    
    
    func addToCartApi(prodId:String) {
        let userID = UserDefaults.standard.value(forKey: "userid") as! String
        
        let parameters:[String:Any] = [  "delivery_mode": "canteen",
                                         "product_id":prodId,
                                         "type": selectedMeal,
                                         "user_id": userID]
        debugPrint("Parameters:- ",parameters)
        HomeDataResponse.homeData(api:StaticURL.addToCartApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
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

struct AdditionalItemsCell1: View {
    
    var foodData:additionalItemData
    @Binding var selectedMeal:String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Food Image
            AsyncImage(url: URL(string:foodData.image ?? "")){ result in
                result.image?
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                    .cornerRadius(1)
                    .padding([.top, .bottom], 10)
                    .padding(-10)
            }
            
            // Food Details
            VStack(alignment: .leading, spacing: 4) {
                Text(foodData.foodItemName ?? "")
                    .font(.headline)
                
                Text(foodData.description?.html2String ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom,5)
            }
            
            // Price and Quantity
            Text(foodData.priceForCanteen ?? "")
                .font(.title3)
                .foregroundColor(.red)
                .padding(.top, -15)
            HStack {
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
                        
                        let strFoodId = String(foodData.foodId ?? 0)
                        addToCartApi(prodId:strFoodId)
                       

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
        .frame(width: 160)
  }
    
    
    func addToCartApi(prodId:String) {
        let userID = UserDefaults.standard.value(forKey: "userid") as! String
        let parameters:[String:Any] = [  "delivery_mode": "canteen",
                                         "product_id":prodId,
                                         "type": selectedMeal,
                                         "user_id": userID]
        debugPrint("Parameters:- ",parameters)
        HomeDataResponse.homeData(api:StaticURL.addToCartApi, parameters:parameters) { (data) in
            if data != nil {
                let responseCode = data?.responseCode
                let responseText = data?.responseText
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


struct SliderView: View {
    
    var bannerData:[bannerData]
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State  var selecation = 0
    var images = ["Food","Food","Food","Food","Food","Food"]
    
    
    var body: some View {
        VStack {
            TabView(selection: $selecation) {
                
                
//                ForEach(viewModel.images.indices, id: \.self) { i in
//                    AsyncImage(url: URL(string: viewModel.images[i])) { image in
//                        image
//                            .resizable()
//                            .scaledToFill()
//                    }
                
                ForEach(0..<images.count, id: \.self) {
                    i in Image("\(images[i])")
                        .resizable()
                }
            }.tabViewStyle(PageTabViewStyle())
                //.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .onReceive(timer, perform: {_ in withAnimation{
                    selecation = selecation < images.count ? selecation + 1: 0
                }
            })
        }.frame(height: 220)
           // .cornerRadius(10.0)
    }
}




/*
 // lunch / dinner
 // canteen / delivery
 "delivery_mode": "canteen", // canteen / delivery
 
 TabView(selection: $selection) {
     ForEach(viewModel.images.indices, id: \.self) { i in
         AsyncImage(url: URL(string: viewModel.images[i])) { image in
             image
                 .resizable()
                 .scaledToFill()
         } placeholder: {
             ProgressView()
         }
     }
 }
 */

