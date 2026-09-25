//
//  AccountView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct AplAccountPage: View {
    
    @State private var logInScreen = false
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    HStack{
                        Text("Date of Birth")
                        
                        Spacer()
                        
                        Text("January 1, 2000")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Location")
                        
                        Spacer()
                        
                        Text("Lucena City")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Contact Number")
                        
                        Spacer()
                        
                        Text("09123456789")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Location")
                        
                        Spacer()
                        
                        Text("Lucena City")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Educational Attainment")
                        
                        Spacer()
                        
                        Text("BS Computer Science")
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Work Experience")
                        
                        Spacer()
                        
                        Text("2 years")
                    }
                    
                    Divider()
                    
                    HStack(alignment: .top){
                        Text("Core Languages")
                        
                        Spacer()
                        
                        VStack(alignment: .trailing){
                            Text("Python")
                            Text("JavaScript")
                            Text("C++")
                        }
                    }
                }
                .padding(.horizontal, 10)
                .frame(width: 363, height: 400)
                .foregroundStyle(.white)
                .background(
                    Color(
                        red: 3/255,
                        green: 82/255,
                        blue: 123/255
                    ).opacity(0.8)
                )
                .cornerRadius(10)
                .shadow(
                    radius: 5,
                    x: 0,
                    y: 5
                )
                
                Button{
                    logInScreen = true
                } label: {
                    Text("Sign Out")
                        .fontWeight(.regular)
                        .padding(.horizontal, 20)
                        .frame(width: 280, height: 38)
                        .foregroundStyle(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.top, 50)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                }
            }
            .frame(width: 350, height:.infinity)
            .appBg()
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $logInScreen) {
                LogInPage()
            }
        }
    }
}

#Preview {
    AplAccountPage()
}
