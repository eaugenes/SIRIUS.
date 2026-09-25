//
//  MainTabView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/14/26.
//

import SwiftUI

struct MainTabView: View{
    
    @State private var selectedTab: NavigationTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                AplHomePage()
                    .tag(NavigationTab.home)
                    .toolbar(.hidden, for: .tabBar)
                
                JobDiscoveryPage()
                    .tag(NavigationTab.jobs)
                    .toolbar(.hidden, for: .tabBar)
                
                ApplicationStatusPage()
                    .tag(NavigationTab.applications)
                    .toolbar(.hidden, for: .tabBar)
                
                AplAccountPage()
                    .tag(NavigationTab.profile)
                    .toolbar(.hidden, for: .tabBar)
            }
            .navigationBarBackButtonHidden(true)
            
            NavigationBar(selectedTab: $selectedTab)
                .padding(.bottom, 10)
        }
        .ignoresSafeArea(.keyboard)     // to overlay components in the screen when keyboard is on
    }
}

#Preview {
    MainTabView()
}
