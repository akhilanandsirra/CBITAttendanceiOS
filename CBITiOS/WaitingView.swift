//
//  WaitingView.swift
//  CBITiOS
//
//  Created by Akhil Anand Sirra on 27/05/20.
//  Copyright © 2020 Akhil Anand Sirra. All rights reserved.
//

import SwiftUI

struct WaitingView: View {
    
    let gradStart=Color(red: 25.0/255, green: 170.0/255, blue: 179.0/255)
    let gradStop=Color(red: 35.0/255, green: 167.0/255, blue: 216.0/255)
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [gradStart, gradStop]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                VStack(){
                    Text("Hello, World.")
                }
            }
        }
    }
}

struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}
