//
//  ProgressRingView.swift
//  Fasting Timer for Extended Fasts
//
//  Created by Vanessa Flores on 9/30/24.
//

import SwiftUI

struct ProgressRingView: View {
    @State var progress = 0.0
    var body: some View {
        ZStack {
            
            // MARK: - Placeholder Ring
            Circle()
                .stroke(lineWidth: 24)
                .foregroundStyle(Color.gray)
                .opacity(0.1)
                .frame(maxWidth: .infinity)
            
            // MARK: - Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [.yellow, .orange, .red, .orange, .yellow]), center: .center), style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
                .frame(maxWidth: .infinity)
            
            // MARK: - Elapsed Time
            VStack(spacing: 12) {
                Text("Elapsed time")
                    .font(.callout)
                
                Text("00:00")
                    .font(.title)
                    .fontWeight(.medium)
            }
        }
        .frame(width: 250, height: 250)
        .padding([.top, .bottom], 10)
        .onAppear {
            progress = 1.0
        }
    }
}

#Preview {
    ProgressRingView()
}
