//
//  WaitingView.swift
//  CBITiOS
//
//  Created by Akhil Anand Sirra on 27/05/20.
//  Copyright © 2020 Akhil Anand Sirra. All rights reserved.
//

import SwiftUI
import WebKit
import Combine

struct WaitingView: View{

    let gradStart=Color(red: 25.0/255, green: 170.0/255, blue: 179.0/255)
    let gradStop=Color(red: 35.0/255, green: 167.0/255, blue: 216.0/255)
    
    let webView = WKWebView()
    @ObservedObject var model = WebViewModel(link: "https://erp.cbit.org.in/")
    
    var classes = [String]()
    var todaysTimetable=[String]()
    var daywiseAttendance=([Array<String>]())
    var counter:Int = 0
    
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [gradStart, gradStop]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                  ActivityIndicator()
                    
            
                  }.foregroundColor(Color.white)
                
                SwiftUIWebView(viewModel: model)
                if model.didFinishLoading {
                    //do your stuff
                }
                
            }
            .padding(.top, 100.0)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}

struct ActivityIndicator: View {

  @State private var isAnimating: Bool = false



  var body: some View {

    GeometryReader { (geometry: GeometryProxy) in

      ForEach(0..<5) { index in

        Group {

          Circle()

            .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)

            .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)

            .offset(y: geometry.size.width / 10 - geometry.size.height / 2)

          }.frame(width: geometry.size.width, height: geometry.size.height)

            .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))

            .animation(Animation

              .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)

              .repeatForever(autoreverses: false))

        }

      }.aspectRatio(1, contentMode: .fit)

        .onAppear {

          self.isAnimating = true

        }

  }

}

class WebViewModel: ObservableObject {
    @Published var link: String
    @Published var didFinishLoading: Bool = false

    init (link: String) {
        self.link = link
    }
}

struct SwiftUIWebView: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel

    let webView = WKWebView()

    func makeUIView(context: UIViewRepresentableContext<SwiftUIWebView>) -> WKWebView {
        self.webView.navigationDelegate = context.coordinator
        if let url = URL(string: viewModel.link) {
            self.webView.load(URLRequest(url: url))
        }
        return self.webView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<SwiftUIWebView>) {
        return
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        private var viewModel: WebViewModel
        var warning:String = ""
        
        init(_ viewModel: WebViewModel) {
            self.viewModel = viewModel
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            //print("WebView: navigation finished")
            webView.evaluateJavaScript("document.getElementById('txtUserName').value='160117737089';document.getElementById('btnNext').click();", completionHandler: nil)
            
            webView.evaluateJavaScript("document.getElementById('lblWarning').innerHTML", completionHandler: { (value, error) in
             if let warning = value as? String{
                 self.warning=warning
             }
             
             if(self.warning == "User Name is Incorrect"){
                 let url=URL(string: "https://erp.cbit.org.in")!
                 let request = URLRequest(url: url)
                 webView.navigationDelegate = self
                 webView.load(request)
                 self.warning=""
             }
            })
             
             
             if(warning != "Password is Incorrect" && warning != "User Name is Incorrect"){ webView.evaluateJavaScript("document.getElementById('txtPassword').value='8055';document.getElementById('btnSubmit').click()")
            }
             
             if(warning == "Password is Incorrect" || warning == "User Name is Incorrect"){
                 let url=URL(string: "https://erp.cbit.org.in")!
                 let request = URLRequest(url: url)
                 webView.navigationDelegate = self
                 webView.load(request)
                 warning=""
             }
            
            self.viewModel.didFinishLoading = true
        }
    }

    func makeCoordinator() -> SwiftUIWebView.Coordinator {
        Coordinator(viewModel)
    }
    
}


