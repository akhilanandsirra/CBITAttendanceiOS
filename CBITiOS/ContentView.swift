//
//  ContentView.swift
//  CBITiOS
//
//  Created by Akhil Anand Sirra on 26/05/20.
//  Copyright © 2020 Akhil Anand Sirra. All rights reserved.
//

import SwiftUI

let gradStart=Color(red: 25.0/255, green: 170.0/255, blue: 179.0/255)
let gradStop=Color(red: 35.0/255, green: 167.0/255, blue: 216.0/255)

struct ContentView: View {
    
    @State var username: String=""
    @State var password: String=""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [gradStart, gradStop]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                user()
                CBITStudentLogin()
                TextField("Username", text: $username)
                .padding(.bottom,20)
                .background(Color.white)
            }
        .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CBITStudentLogin: View {
    var body: some View {
        Text("CBIT Student Login")
            .font(.custom("RobotoCondensed-Regular", size: 40))
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding(.bottom, 20)
    }
}

struct user: View {
    var body: some View {
        Image("user")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 75, height: 75)
            .padding([.leading, .bottom], 10)
    }
}
