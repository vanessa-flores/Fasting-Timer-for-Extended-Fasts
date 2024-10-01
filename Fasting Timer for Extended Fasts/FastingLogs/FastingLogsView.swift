//
//  FastingLogsView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

struct FastingLogsView: View {
    @Bindable var store: StoreOf<FastingLogsSystem>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker("Fasting Logs View", selection: $store.selectedViewType.sending(\.viewAction.selectedLogViewType)) {
                        ForEach(FastingLogsSystem.State.LogViewType.allCases) { viewType in
                            Text(viewType.title)
                                .tag(viewType)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle("Fasting Logs")
        }
    }
}

#Preview {
    FastingLogsView(store: Store(initialState: .default, reducer: {
        FastingLogsSystem()
    }))
}

extension FastingLogsSystem.State {
    static var `default`: Self {
        .init()
    }
}
