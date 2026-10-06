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
    var isMultiline: Bool = false       // for multi-line text (e.g. Description/s)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
                .padding(2)
            
            if isMultiline {
                ZStack(alignment: .topLeading){
                    TextEditor(text: $text)
                        .scrollContentBackground(.hidden)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.black)
                        .padding(6)
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray)
                            .padding(.horizontal, 11)
                            .padding(.vertical, 14)
                            .allowsHitTesting(true)
                    }
                }
                .frame(width: 300, height: 100)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.gray, lineWidth: 1)
                )
            } else if isSecure {           // For Password
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
