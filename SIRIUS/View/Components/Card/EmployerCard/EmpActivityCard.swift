//
//  EmpActivityCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import SwiftUI

// One "Recent Activity" row: icon, title, job position, time
struct EmpActivityCard: View {
    
    let activity: EmpActivity
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: activity.icon)
                .font(.system(size: 18))
                .foregroundStyle(Color.white)
                .frame(width: 46, height: 46)
                .background(Circle().fill(Color.siriusNavy))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(activity.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.black)
                
                Text(activity.jobPosition)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.black)
            }
            
            Spacer()
            
            Text(activity.timeAgo)
                .font(.system(size: 10))
                .foregroundStyle(Color.black)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 2)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(width: 350, height: 66)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 2, y: 3)
    }
}

#Preview {
    EmpActivityCard(activity: EmpInfoController.sampleActivity[0])
        .appBg()
}
