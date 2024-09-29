//
//  RootTabView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

struct RootTabView: View {
    @Bindable var store: StoreOf<RootDomain>
    
    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
            FastingTimerAndPresetsView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag(RootDomain.Tab.timerAndPresets)
            
            FastingLogsView()
                .tabItem {
                    Label("History", systemImage: "list.clipboard")
                }
                .tag(RootDomain.Tab.fastingLogs)
        }
    }
}

#Preview {
    RootTabView(store: Store(initialState: .default, reducer: {
        RootDomain()
    }))
}
