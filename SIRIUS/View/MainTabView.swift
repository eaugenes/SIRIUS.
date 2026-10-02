//
//  MainTabView.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/14/26.
//

import SwiftUI

struct MainTabView: View{
    
    @State private var selectedTab: AplNavigationTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                AplHomePage()
                    .tag(AplNavigationTab.home)
                    .toolbar(.hidden, for: .tabBar)
                
                JobDiscoveryPage()
                    .tag(AplNavigationTab.jobs)
                    .toolbar(.hidden, for: .tabBar)
                
                ApplicationStatusPage()
                    .tag(AplNavigationTab.applications)
                    .toolbar(.hidden, for: .tabBar)
                
                AplAccountPage()
                    .tag(AplNavigationTab.profile)
                    .toolbar(.hidden, for: .tabBar)
            }
            .navigationBarBackButtonHidden(true)
            
            NavigationBar(selectedTab: $selectedTab)
                .padding(10)
        }
        .ignoresSafeArea(.keyboard)     // to overlay components in the screen when keyboard is on
    }
}

#Preview {
    MainTabView()
}
