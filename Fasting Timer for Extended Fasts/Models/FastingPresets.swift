//
//  FastingPresets.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import SwiftUI

public enum FastingPreset: CaseIterable, Equatable {
    case intermittent
    case autophagy
    case gutReset
    case fatBurner
    case dopamineReset
    case immuneReset
    
    var name: String {
        switch self {
        case .intermittent: return NSLocalizedString("Intermittent", comment: "Name of a fasting goal preset")
        case .autophagy: return NSLocalizedString("Autophagy", comment: "Name of a fasting goal preset")
        case .gutReset: return NSLocalizedString("Gut-reset", comment: "Name of a fasting goal preset")
        case .fatBurner: return NSLocalizedString("Fat-burner", comment: "Name of a fasting goal preset")
        case .dopamineReset: return NSLocalizedString("Dopamine-reset", comment: "Name of a fasting goal preset")
        case .immuneReset: return NSLocalizedString("Immune-reset", comment: "Name of a fasting goal preset")
        }
    }
    
    var length: Int {
        switch self {
        case .intermittent: return 12
        case .autophagy: return 17
        case .gutReset: return 24
        case .fatBurner: return 36
        case .dopamineReset: return 48
        case .immuneReset: return 72
        }
    }
    
    var lengthDescription: String {
        switch self {
        case .intermittent: return NSLocalizedString("12-16", comment: "Length of fast in hours")
        case .autophagy: return NSLocalizedString("17", comment: "Length of fast in hours")
        case .gutReset: return NSLocalizedString("24", comment: "Length of fast in hours")
        case .fatBurner: return NSLocalizedString("36", comment: "Length of fast in hours")
        case .dopamineReset: return NSLocalizedString("48", comment: "Length of fast in hours")
        case .immuneReset: return NSLocalizedString("72+", comment: "Length of fast in hours")
        }
    }
    
    // TODO: - display benefits info for each fasting preset
    var benefits: [String] {
        switch self {
        case .intermittent:
            return ["If you want to lose weight", "You're experiencing brain fog", "You're suffering from loss of energy"]
        case .autophagy:
            return ["Slowly turns on around 17 hours and reaches brightest peak at 72 hours", "Detox", "Improve brain function and cognition", "Prevent a cold", "Balance sex hormones"]
        case .gutReset:
            return ["Counteract antibiotic use", "Offset birth control use", "Help tackle small intestinal bacterial overgrowth (SIBO)"]
        case .fatBurner:
            return ["Minimize weight-loss resistance", "Release stored sugar", "Reduce cholesterol"]
        case .dopamineReset:
            return ["Reboot dopamine levels", "Lower anxiety levels"]
        case .immuneReset:
            return ["Ease a chronic condition", "Prevent chronic disease", "Alleviate pain and stiffness of relentless musculoskeletal injuries", "Slow down the effects of aging"]
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .intermittent: return .indigo
        case .autophagy: return .orange
        case .gutReset: return .pink
        case .fatBurner: return .teal
        case .dopamineReset: return .green
        case .immuneReset: return .yellow
        }
    }
}
