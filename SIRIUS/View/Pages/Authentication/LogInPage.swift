//
//  LogInView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct LogInPage: View {
    
    @State private var logInUsername: String = ""
    @State private var logInPassword: String = ""
    @State private var signUpScreen = false
    @State private var nextScreen = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                Image("sirius-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(.top, 50)
                
                Text("SIRIUS")
                    .font(.system(size: 64))
                    .fontWeight(.medium)
                    .tracking(15.0)
                    .padding(.leading, 20)
                
                Text("In a sky full of opportunities, let the right one find you.")
                    .font(.system(size: 11))
                    .fontWeight(.light)
                    .padding(.bottom, 50)
                
                AppTextField(
                    title: "Username",
                    placeholder: "Enter your username",
                    text: $logInUsername,
                    isSecure: false
                )
                
                AppTextField(
                    title: "Password",
                    placeholder: "Enter your password",
                    text: $logInPassword,
                    isSecure: true
                )
                
                Button {
                    nextScreen = true
                } label: {
                    Text("Continue")
                        .fontWeight(.regular)
                        .padding(.horizontal, 20)
                        .frame(width: 280, height: 38)
                        .foregroundStyle(Color.white)
                        .background(Color(red: 10/255, green: 85/255, blue: 128/255))
                        .cornerRadius(10)
                        .padding(.top, 50)
                }
                
                HStack{
                    VStack{Divider().background(Color.black)}
                    
                    Text("or continue with")
                        .font(.system(size: 12))
                        .lineLimit(1)
                        .fixedSize()
                        .padding()
                    
                    VStack{Divider().background(Color.black)}
                }
                .padding(.horizontal, 32)
                
                Text("Google")
                    .font(.system(size: 15))
                    .frame(width: 150, height: 25)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom, 90)
                
                HStack{
                    Text("Don't have an account yet?")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding(5)
                    
                    Button{
                        signUpScreen = true
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                    }
                }
            }
            .appBg()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $signUpScreen) {
                RoleSelectionPage()
            }
            .navigationDestination(isPresented: $nextScreen) {
                MainTabView()
            }
        }
    }
}

// .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 4)

#Preview {
    LogInPage()
}
