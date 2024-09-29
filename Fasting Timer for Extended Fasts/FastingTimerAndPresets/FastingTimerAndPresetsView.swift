//
//  FastingTimerAndPresetsView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

struct FastingTimerAndPresetsView: View {
    @Bindable var store: StoreOf<FastingTimerAndPresetsSystem>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker("Fasting Timer or Fasting Presets", selection: $store.selectedSegment.sending(\.segmentSelected)) {
                        ForEach(FastingTimerAndPresetsSystem.Segment.allCases) { segment in
                            Text(segment.title)
                                .tag(segment)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    switch store.selectedSegment {
                    case .fastingTimer:
                        FastingTimerContainerView()
                    case .fastingPresets:
                        FastingPresetsContainerView(store: store.scope(state: \.fastingPresetsState, action: \.fastingPresetsAction))
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle(store.selectedSegment == .fastingTimer ? "Fasting" : "Fasting Goals")
        }
    }
}

#Preview {
    FastingTimerAndPresetsView(store: Store(initialState: .default, reducer: {
        FastingTimerAndPresetsSystem()
    }))
}

extension FastingTimerAndPresetsSystem.State {
    static var `default`: Self {
        .init()
    }
}
