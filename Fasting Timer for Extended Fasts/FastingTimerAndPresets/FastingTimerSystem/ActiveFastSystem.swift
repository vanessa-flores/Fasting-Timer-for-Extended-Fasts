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
    struct State: Equatable {
        var startButtonState: EditTimeButtonSystem.State = .init(title: "Start", dateAndTime: Date().addingTimeInterval(100))
        var endButtonState: EditTimeButtonSystem.State = .init(title: "End", dateAndTime: Date().addingTimeInterval(500))
    }
    
    // MARK: - Action
    
    enum Action: Equatable {
        case viewAction(ViewAction)
        case startButtonAction(EditTimeButtonSystem.Action)
        case endButtonAction(EditTimeButtonSystem.Action)
        
        @CasePathable
        enum ViewAction: Equatable {
            case startEndFastButtonTapped
        }
    }
    
    // MARK: - Reducer
    
    var body: some Reducer<State, Action> {
        Scope(state: \.startButtonState, action: \.startButtonAction) {
            EditTimeButtonSystem()
        }
        Scope(state: \.endButtonState, action: \.endButtonAction) {
            EditTimeButtonSystem()
        }
        
        Reduce { state, action in
            switch action {
            case .viewAction(let viewAction):
                return handleViewAction(state: &state, action: viewAction)
            case .startButtonAction(let action):
                guard case .delegateAction(let delegateAction) = action else { return .none }
                switch delegateAction {
                case .dateTimeUpdated(let dateTime):
                    print(dateTime)
                }
                return .none
            case .endButtonAction(let action):
                guard case .delegateAction(let delegateAction) = action else { return .none }
                switch delegateAction {
                case .dateTimeUpdated(let dateTime):
                    print(dateTime)
                }
                return .none
            }
        }
    }
    
    // MARK: - Private
    
    private func handleViewAction(state: inout State, action: Action.ViewAction) -> Effect<Action> {
        switch action {
        case .startEndFastButtonTapped:
            print("start or end fast")
            return .none
        }
    }
}
