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
                        
                        HStack(spacing: 20) {
                            // MARK: - Start Time
                            VStack(spacing: 8) {
                                Text("Start")
                                    .foregroundStyle(.secondary)
                                
                                Text(Date(), format: .dateTime.weekday().hour().minute().second())
                                    .fontWeight(.medium)
                            }
                            .padding(20)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                            
                            // MARK: - End Time
                            VStack(spacing: 8) {
                                Text("End")
                                    .foregroundStyle(.secondary)
                                
                                Text(Date().addingTimeInterval(60), format: .dateTime.weekday().hour().minute().second())
                                    .fontWeight(.medium)
                            }
                            .padding(20)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        .padding(.vertical)
                        
                        // MARK: - Start Button
                        Button("End Fast", action: {})
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .padding(.top)

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
