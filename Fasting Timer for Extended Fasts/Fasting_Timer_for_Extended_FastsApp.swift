//
//  Fasting_Timer_for_Extended_FastsApp.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct Fasting_Timer_for_Extended_FastsApp: App {
    let rootDomainStore = StoreOf<RootDomain>(initialState: .default) {
        RootDomain()
    }
    
    var body: some Scene {
        WindowGroup {
            RootTabView(store: rootDomainStore)
        }
    }
}

extension RootDomain.State {
    static var `default`: Self {
        .init()
    }
}
