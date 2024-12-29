//
//  ContentView.swift
//  animationApp
//
//  Created by NGUELE Steve  on 26/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("chargement", systemImage: "swirl.circle.righthalf.filled.inverse") {
                CercleChargementVue()
            }
            Tab("Suppression", systemImage: "trash.circle.fill") {
                DeleteNumberVue()
            }
            Tab("Retourner", systemImage: "arrow.clockwise.circle.fill") {
                RetournerCarteView()
            }
        }
    }
}

#Preview {
    ContentView()
}
