//
//  JobApplicationCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/16/26.
//

import SwiftUI

struct JobApplicationCard: View {
    let application: JobApplication
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(application.role)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text(application.company)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
                Text("Applied on \(application.dateApplied)")
                    .font(.system(size: 11, weight: .light))
                    .foregroundColor(.black)
            }
            Spacer()
            
            // Status Tag
            Text(application.status.rawValue)
                .font(.system(size: 10, weight: .medium))
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .foregroundStyle(.white)
                .background(statusColor(for: application.status))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private func statusColor(for status: ApplicationStatus) -> Color {
        switch status {
        case .applied: return Color(
                                red: 3/255,
                                green: 82/255,
                                blue: 123/255
                            )
        case .interview: return Color(
                                red: 3/255,
                                green: 82/255,
                                blue: 123/255
                            )
        case .accepted: return Color(
                                red: 3/255,
                                green: 82/255,
                                blue: 123/255
                            )
        case .rejected: return Color(
                                red: 3/255,
                                green: 82/255,
                                blue: 123/255
                            )
        case .all: return Color(
                                red: 3/255,
                                green: 82/255,
                                blue: 123/255
                            )
        }
    }
}
