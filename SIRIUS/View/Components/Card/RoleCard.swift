//
//  RoleCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct RoleCard: View {
    
    let title: String
    let description: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack{
                Image(systemName: icon)
                    .padding(12)
                    .background(.white)
                    .cornerRadius(10)
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundStyle(isSelected ? Color.black : Color.white)
                        .padding(.bottom, 5)
                    
                    Text(description)
                        .font(Font.system(size: 9.5))
                        .foregroundStyle(isSelected ? Color.black : Color.white)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }
            .padding(18)
            .frame(maxWidth: 350, minHeight: 70)
            .background(isSelected ? Color.blue : Color(red: 10/255, green: 85/255, blue: 128/255))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(isSelected ? Color(red: 20/255, green: 110/255, blue:245/255) : Color.clear, lineWidth: 2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
    }
}
