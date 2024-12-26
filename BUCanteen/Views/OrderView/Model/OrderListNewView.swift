//
//  OrderListNewView.swift
//  BUCanteen
//
//  Created by Prince on 15/11/24.
//

import SwiftUI
import Foundation

struct OrderListNewView: View {
    @StateObject private var viewModel = OrdersViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading orders...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.ordersData) { order12 in
                        VStack(alignment: .leading) {
                            Text(order12.title)
                                .font(.headline)
                            Text(order12.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Orders")
            .onAppear {
                viewModel.fetchOrders(userID: 27)
            }
        }
    }
}

#Preview {
    OrderListNewView()
}




struct Order11: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
}

struct ApiResponse: Codable {
    let success: Bool
    let data: [Order11]
}


class OrdersViewModel: ObservableObject {
    @Published var ordersData: [Order11] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchOrders(userID: Int) {
        let urlString = "https://www.bwupetpujo.in/api/get-orders"
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["user_id": userID]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        self.isLoading = true
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }
                
                do {
                    let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                    if apiResponse.success {
                        self?.ordersData = apiResponse.data
                    } else {
                        self?.errorMessage = "Failed to fetch orders"
                    }
                } catch {
                    self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
