//
//  LinearBgModifier.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/8/26.
//

import SwiftUI

struct LinearBgModifier: ViewModifier {
    
    let topBotBlue = Color(red: 0.13, green: 0.38, blue: 0.54)
    let centerWhite = Color.white
    
    func body(content: Content) -> some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [topBotBlue, centerWhite, topBotBlue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .all)
            
            content
        }
    }
}

extension View {
    func appBg() -> some View {
        self.modifier(LinearBgModifier())
    }
}
