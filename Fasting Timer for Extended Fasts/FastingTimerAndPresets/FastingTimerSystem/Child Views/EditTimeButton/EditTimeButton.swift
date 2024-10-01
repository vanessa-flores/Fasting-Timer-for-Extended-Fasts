//
//  EditTimeButton.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/30/24.
//

import ComposableArchitecture
import SwiftUI

struct EditTimeButton: View {
    let store: StoreOf<EditTimeButtonSystem>
    
    var body: some View {
        VStack(spacing: 8) {
            Text(store.title)
                .foregroundStyle(.secondary)
            
            Text(store.dateAndTime, format: .dateTime.weekday().hour().minute().second())
                .fontWeight(.medium)
        }
        .padding(20)
        .background(.gray.opacity(0.1))
        .cornerRadius(10)
        .onTapGesture {
            store.send(.viewAction(.editTimeButtonTapped))
        }
    }
}

#Preview {
    EditTimeButton(store: Store(initialState: .initialState, reducer: {
        EditTimeButtonSystem()
    }))
}

extension EditTimeButtonSystem.State {
    fileprivate static let initialState = Self(title: "Start", dateAndTime: Date().addingTimeInterval(60))
}
