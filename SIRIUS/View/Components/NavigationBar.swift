//
//  NavigationBar.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/14/26.
//

import SwiftUI

struct NavigationBar: View {
    
    @Binding var selectedTab: NavigationTab
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(NavigationTab.allCases, id: \.self) { tab in
                let isActive = selectedTab == tab
                
                Button {
                    withAnimation(.spring(duration: 0.3, bounce: 0.3))
                    {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.iconTypes)
                            .font(.system(size: 15, weight: .regular))
                        
                        Text(tab.rawValue)
                            .font(.system(size: 8, weight: .regular))
                    }
                    .foregroundColor(isActive ? Color.black : Color.white)
                    .frame(maxWidth: 66, maxHeight: 50)
                    .padding(.vertical, 5)
                    .background{
                        if isActive {RoundedRectangle (
                                cornerRadius: 10
                            )
                        .fill(
                            Color(
                                red: 232/255,
                                green: 240/255,
                                blue: 255/255
                            )
                        )
                        .matchedGeometryEffect(id: "activePill", in: animation)
                            
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 270, maxHeight: 50)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    Color(
                        red: 0/255,
                        green: 61/255,
                        blue: 92/255
                    )
                )
        )
    }
}
