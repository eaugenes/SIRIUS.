//
//  QualiMatchCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/15/26.
//

import SwiftUI

struct QualiMatchCard: View {
    var percentage: String
    var title: String
    var subtext: String?
    
    private var hasSubtext: Bool {
        if let subtext = subtext {
            return !subtext.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        
        return false
    }
    
    var body: some View {
        HStack{
            Text(percentage)
                .font(.system(size: hasSubtext ? 40: 16, weight: hasSubtext ? .bold : .semibold))
                .foregroundColor(.white)
                .padding(.leading, 25)
                .padding(.trailing, hasSubtext ? 15 : 1)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: hasSubtext ? 14 : 16, weight: hasSubtext ? .bold : .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, hasSubtext ? 5 : 0)
                
                if hasSubtext, let subtext = subtext {
                    Text(subtext)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
                .frame(width: 30)
        }
        .frame(width: 360, height: hasSubtext ? 100 : 40)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(
                            red: 4/255,
                            green: 48/255,
                            blue: 96/255
                        ),
                        Color(
                            red: 139/255,
                            green: 255/255,
                            blue: 149/255
                        )
                    ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(12)
        .shadow(
            color: Color(
                red: 4/255,
                green: 48/255,
                blue: 96/255
            ),
            radius: 3,
            x: 3,
            y: 3
        )
    }
}

#Preview {
    QualiMatchCard(
        percentage: "90%",
        title: "Average Qualification Match",
//        subtext: "12 matched positions in total"
    )
}
