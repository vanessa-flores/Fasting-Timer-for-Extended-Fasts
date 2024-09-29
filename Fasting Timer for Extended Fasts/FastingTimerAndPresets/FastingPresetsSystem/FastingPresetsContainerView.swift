//
//  FastingPresetsContainerView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

struct FastingPresetsContainerView: View {
    let store: StoreOf<FastingPresetsSystem>
    
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(store.fastingPresetsData, id: \.self) { preset in
                    FastingPresetView(fastingPreset: preset)
                        .onTapGesture {
                            store.send(.view(.presetTapped(preset)))
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    FastingPresetsContainerView(store: Store(initialState: .default, reducer: {
        FastingPresetsSystem()
    }))
}

extension FastingPresetsSystem.State {
    static var `default`: Self {
        .init()
    }
}
