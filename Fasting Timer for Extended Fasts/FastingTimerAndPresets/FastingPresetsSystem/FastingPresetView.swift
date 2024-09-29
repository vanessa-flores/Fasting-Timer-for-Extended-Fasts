//
//  FastingPresetView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/29/24.
//

import SwiftUI

struct FastingPresetView: View {
    let fastingPreset: FastingPreset
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(fastingPreset.lengthDescription)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("hours")
                        .font(.headline)
                }
                Spacer()
            }
            
            Spacer()
            
            Text(fastingPreset.name)
        }
        .padding()
        .frame(width: 150, height: 155)
        .background(fastingPreset.backgroundColor.gradient)
        .tint(.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    FastingPresetView(fastingPreset: FastingPreset.intermittent)
}
