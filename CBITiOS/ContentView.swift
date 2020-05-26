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
                VStack(){
                    TextField("Username", text: $username)
                        .padding(15)
                        .keyboardType(.numberPad)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
                        .font(.custom("RobotoCondensed-Regular", size: 18))
                        .padding(.bottom,20)
                        .foregroundColor(Color.white)
                    SecureField("Password", text: $password)
                    .padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .padding(.bottom,20)
                    .foregroundColor(Color.white)
                    Button(action: {
                        print("login")
                    }) {
                        Text("Login")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 40)
                        .foregroundColor(.white)
                        .font(.custom("RobotoCondensed-Regular", size: 20))
                        .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.white, lineWidth: 1))
                    }
                }
            }
        .padding(20)
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
