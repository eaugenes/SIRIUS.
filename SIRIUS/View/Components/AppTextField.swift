//
//  AppTextField.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct AppTextField: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false          // for SecureField
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
                .padding(2)
            
            if isSecure {           // For Password
                SecureField(placeholder, text: $text)
                    .font(.system(size: 12))
                    .padding(10)
                    .frame(width: 300, height: 35)
                    .border(Color.gray, width: 2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
            } else {                // For Any Type of TextField
                TextField(placeholder, text: $text)
                    .font(.system(size: 12))
                    .padding(10)
                    .frame(width: 300, height: 35)
                    .border(Color.gray, width: 2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.gray, lineWidth: 1)
                    )
            }
            
        }
    }
}


//Text("Username")
//    .font(.system(size: 13))
//    .fontWeight(.medium)
//
//TextField("Enter your username", text: $logInUsername)
//    .font(.system(size: 12))
//    .padding(10)
//    .frame(width: 300, height: 35)
//    .border(Color.gray, width: 2)
//    .background(Color.white)
//    .cornerRadius(10)
//    .overlay(
//        RoundedRectangle(cornerRadius: 10)
//            .strokeBorder(Color.gray, lineWidth: 2)
//    )
