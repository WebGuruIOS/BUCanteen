//
//  PaymentView.swift
//  BUCanteen
//
//  Created by Prince on 11/12/24.
//

import SwiftUI
import WebKit

struct PaymentView: View {
    
    @State private var htmlString: String = ""
    @State var paymentHtmlUrl:String
    @Environment(\.dismiss) var dismiss
   // let htmlContent: String
   // let onMessageReceived: (String) -> Void
    
    @State private var messageFromWebView: String = "No message received"
    
    var body: some View {
        ZStack{
            VStack {
                // Header
                           HStack {
                               Button(action: {
                                   dismiss()
                               }) {
                                   Image("Back")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 35,height: 35)
                                       .foregroundColor(Color.white)
                               }
                               .frame(maxHeight:.infinity)
                               .frame(width: 50)
                               Spacer()
                           }
                           .frame(height: 60)
                           .padding(.horizontal)
                           .background(Color.custorange)
                           .padding(.top, 1)
                           // End Header
                Spacer()
                
                VStack {
                    if htmlString.isEmpty {
                        Text("Loading...")
                            .onAppear {
                                loadHTML() // Load HTML content into the string
                            }
                    } else {
                        HTMLWebView(htmlContent: htmlString)
                            .edgesIgnoringSafeArea(.all) // Render HTML in WebView
                    }
                }
                
                
//                VStack {
//                    Text("Message from WebView:")
//                        .font(.headline)
//                    Text(messageFromWebView)
//                        .foregroundColor(.blue)
//                        .padding()
//
//                    Divider()
//
//                    InteractiveWebView(
//                        htmlContent: htmlString,
//                        onMessageReceived: { message in
//                            messageFromWebView = message
//                        }
//                    )
//                    .edgesIgnoringSafeArea(.all)
//                }
//                .onAppear {
//                    loadHTML()
//                }
            }
            .navigationBarBackButtonHidden(true)
            
        }
       
    }
    
    // Function to set the HTML string
    private func loadHTML() {
        htmlString = paymentHtmlUrl
    }
    
    //Equivalent of webViewDidStartLoad:
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start: \(String(describing: webView.url?.description))")
    }

    //Equivalent of didFailLoadWithError:
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        let nserror = error as NSError
        if nserror.code != NSURLErrorCancelled {
            webView.loadHTMLString("Page Not Found", baseURL: URL(string: "https://developer.apple.com/"))
        }
    }
    
    //Equivalent of webViewDidFinishLoad:
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish - webView.url: \(String(describing: webView.url?.description))")
    }

}

// WebView Component
struct HTMLWebView: UIViewRepresentable {
    let htmlContent: String // HTML content as a string

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}



// WebView with JavaScript Message Handler
struct InteractiveWebView: UIViewRepresentable {
    let htmlContent: String
    let onMessageReceived: (String) -> Void

    func makeCoordinator() -> Coordinator {
        return Coordinator(onMessageReceived: onMessageReceived)
    }

    func makeUIView(context: Context) -> WKWebView {
        let contentController = WKUserContentController()
        let config = WKWebViewConfiguration()

        // Add message handler
        contentController.add(context.coordinator, name: "callbackHandler")
        config.userContentController = contentController

        // Initialize WKWebView with configuration
        let webView = WKWebView(frame: .zero, configuration: config)

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }

    class Coordinator: NSObject, WKScriptMessageHandler {
        var onMessageReceived: (String) -> Void

        init(onMessageReceived: @escaping (String) -> Void) {
            self.onMessageReceived = onMessageReceived
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "callbackHandler", let body = message.body as? String {
                onMessageReceived(body)
            }
        }
    }
}




/*
 import SwiftUI
 import WebKit

 

 struct ContentView: View {
     @State private var messageFromWebView = "No message received"
     @State private var htmlString: String = ""

     var body: some View {
         VStack {
             Text("Message from WebView:")
             Text(messageFromWebView)
                 .foregroundColor(.blue)
                 .padding()

             InteractiveWebView(
                 htmlContent: htmlString,
                 onMessageReceived: { message in
                     messageFromWebView = message
                 }
             )
         }
         .onAppear {
             loadHTML()
         }
     }

     private func loadHTML() {
         htmlString = """
         <!DOCTYPE html>
         <html>
         <body>
             <h1>Hello, SwiftUI WebView</h1>
             <button onclick="sendMessage()">Send Message to Swift</button>
             <script>
                 function sendMessage() {
                     window.webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript!");
                 }
             </script>
         </body>
         </html>
         """
     }
 }


 */
