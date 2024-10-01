//
//  ActiveFastContainerView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

struct ActiveFastContainerView: View {
    let store: StoreOf<ActiveFastSystem>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        
                        // MARK: - Fasting Plan
                        VStack(spacing: 8) {
                            Text("36 hours")
                                .font(.title2)
                            Text("Fat-burner")

                        }
                        .frame(maxWidth: .infinity)
                        .padding([.top, .bottom], 10)
                        
                        // MARK: - Progress Ring
                        ProgressRingView()
                            .frame(maxWidth: .infinity)
                        
                        // MARK: - Start Button
                        Button("End Fast", action: {
                            store.send(.viewAction(.startEndFastButtonTapped))
                        })
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .padding(.top)
                        
                        HStack(spacing: 20) {
                            // MARK: - Start Time
                            EditTimeButton(store: store.scope(state: \.startButtonState, action: \.startButtonAction))
                            
                            // MARK: - End Time
                            EditTimeButton(store: store.scope(state: \.endButtonState, action: \.endButtonAction))
                        }
                        .padding(.vertical)

                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle("Fast")
        }
    }
}

#Preview {
    ActiveFastContainerView(store: Store(initialState: .initialState, reducer: {
        ActiveFastSystem()
    }))
}

extension ActiveFastSystem.State {
    fileprivate static let initialState = Self()
}
