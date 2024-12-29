//
//  CercleChargementVue.swift
//  animationApp
//
//  Created by NGUELE Steve  on 26/12/2024.
//

import SwiftUI

struct CercleChargementVue: View {
    
    @State private var rotationAngle: Double = 0
    @State private var longueur: Double = 0.2
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: longueur)
                .stroke(lineWidth: 5)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle.degrees(rotationAngle))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                        longueur *= 2
                    }
            }
        }
    }
}

#Preview {
    CercleChargementVue()
}
