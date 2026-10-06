//
//  EmpJobCard.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import SwiftUI

struct EmpJobCard: View {
    
    let job: Job
    
    private var postedText: String {
        job.datePosted.formatted(.dateTime.month(.abbreviated).day().year())
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(job.jobPos)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.black)
                
                Text("\(job.applicantCount) Applicants")
                    .font(.system(size: 11))
                    .foregroundStyle(Color.black)
                
                Text("Posted on \(postedText)")
                    .font(.system(size: 9, weight: .light))
                    .foregroundStyle(Color.black)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color.black)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(width: 350)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 2, y: 3)
        .contentShape(Rectangle())
    }
}

#Preview {
    EmpJobCard(job: EmpJobController.sampleJobs[0])
        .appBg()
}
