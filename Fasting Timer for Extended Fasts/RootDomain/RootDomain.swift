//
//  RootDomain.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootDomain {
    
    @ObservableState
    struct State {
        var selectedTab = Tab.timerAndPresets
        var timerAndPresetsState = FastingTimerAndPresetsSystem.State()
        var fastingLogsState = FastingLogs.State()
    }
    
    enum Tab {
        case timerAndPresets
        case fastingLogs
    }
    
    enum Action {
        case tabSelected(Tab)
    }
    
    // MARK: - Reducer
    
    var body: some ReducerOf<RootDomain> {
        Reduce { state, action in
            switch action {
            case .tabSelected(let selectedTab):
                state.selectedTab = selectedTab
                return .none
            }
        }
    }
}

