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
    struct State: Equatable {
        var selectedTab = Tab.timerAndPresets
        var timerAndPresetsState = FastingTimerAndPresetsSystem.State()
        var fastingLogsState = FastingLogs.State()
    }
    
    enum Tab: Equatable {
        case timerAndPresets
        case fastingLogs
    }
    
    enum Action: Equatable {
        case tabSelected(Tab)
        case fastingTimerAndPresets(FastingTimerAndPresetsSystem.Action)
        case fastingLogs(FastingLogs.Action)
    }
    
    // MARK: - Reducer
    
    var body: some ReducerOf<RootDomain> {
        Scope(state: \.timerAndPresetsState, action: \.fastingTimerAndPresets) {
            FastingTimerAndPresetsSystem()
        }
        Scope(state: \.fastingLogsState, action: \.fastingLogs) {
            FastingLogs()
        }
        
        Reduce { state, action in
            switch action {
            case .tabSelected(let selectedTab):
                state.selectedTab = selectedTab
                return .none
            case .fastingTimerAndPresets:
                return .none
            }
        }
    }
}

