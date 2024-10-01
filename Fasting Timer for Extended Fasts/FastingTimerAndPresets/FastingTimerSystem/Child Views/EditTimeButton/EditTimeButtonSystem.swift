//
//  EditTimeButtonSystem.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/30/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct EditTimeButtonSystem {
    
    // MARK: - State
    
    @ObservableState
    struct State: Equatable {
        let title: String
        let dateAndTime: Date
    }
    
    // MARK: - Action
    
    enum Action: Equatable {
        case viewAction(ViewAction)
        case delegateAction(DelegateAction)
        
        @CasePathable
        enum ViewAction: Equatable {
            case editTimeButtonTapped
        }
        
        @CasePathable
        enum DelegateAction: Equatable {
            case dateTimeUpdated(Date)
        }
    }
    
    // MARK: - Reducer
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .viewAction(let viewAction):
            return handleViewAction(state: &state, action: viewAction)
        case .delegateAction:
            return .none
        }
    }
    
    // MARK: - Private
    
    private func handleViewAction(state: inout State, action: Action.ViewAction) -> Effect<Action> {
        switch action {
        case .editTimeButtonTapped:
            print("show date and time picker")
            return .send(.delegateAction(.dateTimeUpdated(Date().addingTimeInterval(10))))
        }
    }
}
