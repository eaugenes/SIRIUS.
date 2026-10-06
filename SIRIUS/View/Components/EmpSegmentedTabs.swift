//
//  EmpSegmentedTabs.swift
//  SIRIUS
//
//  Created by Mac-LAB on 10/6/26.
//

import SwiftUI

// White capsule with a dark-blue selected pill (Active/Inactive, All/To Review/Interview/Hired)
struct EmployerSegmentedTabs<Item: Hashable>: View {
    
    let items: [Item]
    let title: (Item) -> String
    @Binding var selection: Item
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { item in
                let isSelected = selection == item
                
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selection = item
                    }
                } label: {
                    Text(title(item))
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(isSelected ? Color.white : Color.black)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(
                            Capsule().fill(isSelected ? Color.siriusNavy : Color.clear)
                        )
                }
            }
        }
        .padding(3)
        .background(Capsule().fill(Color.white))
        .frame(width: 350)
    }
}

#Preview {
    EmployerSegmentedTabs(
        items: JobListTab.allCases,
        title: { $0.rawValue },
        selection: .constant(JobListTab.active)
    )
    .appBg()
}
