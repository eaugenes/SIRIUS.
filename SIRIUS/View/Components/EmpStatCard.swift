//
//  EmpStatCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import SwiftUI

struct EmpStatCard: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text("\(value)")
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(Color.black)
            
            Text(title)
                .font(.system(size: 14))
                .foregroundStyle(Color.black)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 58)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 2, y: 3)
    }
}

#Preview {
    EmpStatCard(value: 200, title: "Applicants")
        .padding()
        .appBg()
}
