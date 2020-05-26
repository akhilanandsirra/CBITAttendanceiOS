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
    
    @State private var showingAlert = false
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [gradStart, gradStop]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    user()
                    CBITStudentLogin()
                    VStack(){
                        usernameTextfield(username: $username)
                        passwordTextField(password: $password)
                        NavigationLink(destination: WaitingView()) {
                            login()
                        }
                        /*Button(action: {
                            if self.username=="" || self.password==""{
                                self.showingAlert = false
                            }
                        }) {
                            login()
                        }
                        .alert(isPresented: $showingAlert) {
                                   Alert(title: Text("Login Failed"), message: Text("Username or Password is invalid."), dismissButton: .default(Text("Try again")))
                        }*/
                    }
                }
            .padding(20)
            }
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
            .font(.custom("RobotoCondensed-Regular", size: 36))
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
            .frame(width: 60.0, height: 60.0)
            .padding([.leading, .bottom], 10)
    }
}

struct login: View {
    var body: some View {
        Text("Login")
            .padding(.vertical, 8)
            .padding(.horizontal, 50)
            .foregroundColor(.white)
            .font(.custom("RobotoCondensed-Regular", size: 16))
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth: 1))
    }
}

struct usernameTextfield: View {
    
    @Binding var username:String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding(15)
            .keyboardType(.numberPad)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
            .font(.custom("RobotoCondensed-Regular", size: 18))
            .padding(.bottom,20)
            .foregroundColor(Color.white)
    }
}

struct passwordTextField: View {
    
    @Binding var password:String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
            .font(.custom("RobotoCondensed-Regular", size: 18))
            .padding(.bottom,40)
            .foregroundColor(Color.white)
    }
}
