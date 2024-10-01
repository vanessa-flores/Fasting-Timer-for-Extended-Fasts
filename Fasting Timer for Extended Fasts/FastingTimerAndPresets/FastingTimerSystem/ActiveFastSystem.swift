//
//  ActiveFastSystem.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ActiveFastSystem {
    
    // MARK: - State
    
    @ObservableState
    struct State: Equatable {}
    
    // MARK: - Action
    
    enum Action: Equatable {
        case view(ViewAction)
        
        enum ViewAction: Equatable {}
    }
    
    // MARK: - Reducer
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
