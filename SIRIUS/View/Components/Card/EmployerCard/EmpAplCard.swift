//
//  EmpAplCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import SwiftUI

// Applicant row. When selected, the card slides left and reveals
// the envelope (schedule interview) and red X (remove) buttons.
struct EmpAplCard: View {
    
    let applicant: EmpApplicant
    let isSelected: Bool
    var onSelect: () -> Void
    var onSchedule: () -> Void
    var onRemove: () -> Void
    
    private let cardWidth: CGFloat = 350
    private let actionSize: CGFloat = 52
    private let slideDistance: CGFloat = 120
    
    private var experienceText: String {
        applicant.yearsExperience == 1
            ? "1 year work experience"
            : "\(applicant.yearsExperience) years work experience"
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Action buttons stay pinned to the right edge, hidden until selected
            HStack(spacing: 8) {
                Button(action: onSchedule) {
                    Image(systemName: "envelope")
                        .font(.system(size: 22))
                        .foregroundStyle(Color.black)
                        .frame(width: actionSize, height: actionSize)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                }
                
                Button(action: onRemove) {
                    Image(systemName: "xmark")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundStyle(Color.white)
                        .frame(width: actionSize, height: actionSize)
                        .background(Color(red: 0.45, green: 0.0, blue: 0.0))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                }
            }
            .frame(width: cardWidth, alignment: .trailing)
            .opacity(isSelected ? 1 : 0)
            .allowsHitTesting(isSelected)
            
            card
                .offset(x: isSelected ? -slideDistance : 0)
                .onTapGesture(perform: onSelect)
        }
        .frame(width: cardWidth)
        .animation(.spring(duration: 0.3, bounce: 0.2), value: isSelected)
    }
    
    private var card: some View {
        HStack(alignment: .center, spacing: 8) {
            VStack(alignment: .leading, spacing: 3) {
                Text(applicant.name)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color.black)
                
                Text(applicant.degree)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.black)
                
                Text(experienceText)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.black)
            }
            
            Spacer(minLength: 4)
            
            VStack(spacing: 3) {
                ForEach(Array(applicant.coreLanguages.prefix(3)), id: \.self) { language in
                    Text(language)
                        .font(.system(size: 8))
                        .foregroundStyle(Color.white)
                        .frame(width: 76, height: 14)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.siriusNavy))
                }
            }
            
            matchIndicator
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(width: cardWidth)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.35), radius: 3, x: 3, y: 3)
    }
    
    // Green bar that fills according to the match percentage
    private var matchIndicator: some View {
        let height: CGFloat = 56
        let fraction = CGFloat(min(max(applicant.matchPercentage, 0), 100)) / 100
        let green = Color(red: 0.12, green: 0.65, blue: 0.15)
        
        return ZStack(alignment: .bottom) {
            Capsule().fill(green.opacity(0.2))
            Capsule().fill(green).frame(height: height * fraction)
        }
        .frame(width: 7, height: height)
        .accessibilityLabel("\(applicant.matchPercentage) percent match")
    }
}

#Preview {
    VStack {
        EmpAplCard(applicant: EmpAplStatusController.sampleApplicants[0], isSelected: false, onSelect: {}, onSchedule: {}, onRemove: {})
        EmpAplCard(applicant: EmpAplStatusController.sampleApplicants[1], isSelected: true, onSelect: {}, onSchedule: {}, onRemove: {})
    }
    .appBg()
}
