//
//  RetournerCarteView.swift
//  animationApp
//
//  Created by NGUELE Steve  on 29/12/2024.
//

import SwiftUI

struct RetournerCarteView: View {
    
    @State private var recto = false
    @State private var isRotating = false
    //les optionnels
    @State private var image: Image?
    @State private var titre: String?
    @State private var description: String?
    
    var body: some View {
        VStack {
            VStack {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 250)
                        .padding()
                }
                if let titre = titre {
                    Text(titre)
                        .font(.title)
                        .bold()
                }
                if let description = description {
                    Text(description)
                        .font(.callout)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
            }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                .padding()
                .frame(width: 400, height: 600)
                .onAppear {
                    toggleRecto()
                }
                .rotation3DEffect(.degrees(isRotating ? 360 : 0),
                                  axis: (x: 0, y: 1, z: 0))
            Rectangle()
                .frame(height: 40)
                .foregroundStyle(.clear)
            Button {
                withAnimation(.linear(duration: 1)) {
                    isRotating.toggle()
                }
                toggleRecto()
            }label: {
                Text("Retourner la carte")
                    .padding()
                    .background(.tint)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
    
    func toggleRecto() {
        recto.toggle()
        if recto {
            image = Image("default_image")
            titre = "Recto"
            description = "Recto de la carte.\nAppuyez sur le bouton ci-dessous pour retourner la carte"
        }else {
            image = nil
            titre = "Verso"
            description = "Verso de la carte.\nAppuyez sur le bouton ci-dessous pour retourner la carte"
        }
    }
}

#Preview {
    RetournerCarteView()
}
