//
//  FastingTimerAndPresetsSystem.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct FastingTimerAndPresetsSystem {
    
    @ObservableState
    struct State: Equatable {
        var selectedSegment = Segment.fastingTimer
        var fastingTimerState = FastingTimerSystem.State()
        var fastingPresetsState = FastingPresetsSystem.State()
    }
    
    enum Segment: CaseIterable, Identifiable, Equatable {
        case fastingTimer
        case fastingPresets
        
        var title: String {
            switch self {
            case .fastingTimer: return "Timer"
            case .fastingPresets: return "Presets"
            }
        }
        
        var id: Self { self }
    }
    
    enum Action: Equatable {
        case segmentSelected(Segment)
        case fastingTimerAction(FastingTimerSystem.Action)
        case fastingPresetsAction(FastingPresetsSystem.Action)
    }
    
    // MARK: - Reducer
    
    var body: some ReducerOf<FastingTimerAndPresetsSystem> {
        Scope(state: \.fastingTimerState, action: \.fastingTimerAction) {
            FastingTimerSystem()
        }
        Scope(state: \.fastingPresetsState, action: \.fastingPresetsAction) {
            FastingPresetsSystem()
        }
        
        Reduce { state, action in
            switch action {
            case .segmentSelected(let selectedSegment):
                state.selectedSegment = selectedSegment
                return .none
            case .fastingTimerAction: return .none
            case .fastingPresetsAction(let action):
                guard case .delegate(let childAction) = action else { return .none }
                switch childAction {
                case .presetSelected(let fastingPreset):
                    print(fastingPreset.name)
                    return .send(.segmentSelected(.fastingTimer))
                }
            }
        }
    }
}

