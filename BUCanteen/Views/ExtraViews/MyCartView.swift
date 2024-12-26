//
//  CartView.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var response: String // Bind the response to a SwiftUI state variable
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.configuration.userContentController.add(context.coordinator, name: "callbackHandler")
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the web view if needed
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // Capture messages from JavaScript
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "callbackHandler", let messageBody = message.body as? String {
                DispatchQueue.main.async {
                    self.parent.response = messageBody
                }
            }
        }
        
        // Handle when a page finishes loading
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { result, error in
                if let title = result as? String {
                    DispatchQueue.main.async {
                        self.parent.response = title // Example: Set the page title as the response
                    }
                }
            }
        }
    }
}




struct MyCartView: View {
    @State private var response: String = "No response yet"
    
    var body: some View {
        VStack {
            Text("Response: \(response)")
                .padding()
            
            WebView(url: URL(string: "https://www.example.com")!, response: $response)
                .frame(height: 400)
        }
    }
}


#Preview {
    MyCartView()
}

//window.webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript");
