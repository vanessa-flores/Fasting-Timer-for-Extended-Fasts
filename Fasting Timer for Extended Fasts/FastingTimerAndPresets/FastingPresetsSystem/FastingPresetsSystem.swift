//
//  FastingPresetsSystem.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct FastingPresetsSystem {
    @ObservableState
    struct State: Equatable {
        let fastingPresetsData = FastingPreset.allCases.map { $0 }
    }
    
    enum Action: Equatable {
        case view(ViewAction)
        case delegate(DelegateAction)
        
        enum ViewAction: Equatable {
            case presetTapped(FastingPreset)
        }
        
        @CasePathable
        enum DelegateAction: Equatable {
            case presetSelected(FastingPreset)
        }
    }
    
    // MARK: - Reducer
        
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .view(viewAction):
                return reduceViewAction(&state, action: viewAction)
            case .delegate:
                return .none
            }
        }
    }
    
    // MARK: - ViewAction
        
    private func reduceViewAction(_ state: inout State, action: Action.ViewAction) -> Effect<Action> {
        switch action {
        case let .presetTapped(fastingPreset):
            return .send(.delegate(.presetSelected(fastingPreset)))
        }
    }
}
