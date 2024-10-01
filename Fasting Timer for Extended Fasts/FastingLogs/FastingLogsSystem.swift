//
//  FastingLogs.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct FastingLogsSystem {
    
    // MARK: - State
    
    @ObservableState
    struct State: Equatable {
        var selectedViewType = LogViewType.week
        
        enum LogViewType: CaseIterable, Identifiable {
            case week
            case month
            
            var title: String {
                switch self {
                case .week: return "Week"
                case .month: return "Month"
                }
            }
            
            var id: Self { self }
        }
    }
    
    // MARK: - Action
    
    enum Action: Equatable {
        case viewAction(ViewAction)
        
        @CasePathable
        enum ViewAction: Equatable {
            case selectedLogViewType(State.LogViewType)
        }
    }
    
    // MARK: - Reducer
    
    var body: some ReducerOf<FastingLogsSystem> {
        Reduce { state, action in
            switch action {
            case .viewAction(let viewAction):
                return handleViewAction(state: &state, action: viewAction)
            }
        }
    }
    
    // MARK: - Private
    
    private func handleViewAction(state: inout State, action: Action.ViewAction) -> Effect<Action> {
        switch action {
        case .selectedLogViewType(let selectedViewType):
            state.selectedViewType = selectedViewType
            print("show the other view type")
            return .none
        }
    }
}
