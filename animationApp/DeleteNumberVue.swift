//
//  DeleteNumberVue.swift
//  animationApp
//
//  Created by NGUELE Steve  on 26/12/2024.
//

import SwiftUI

struct DeleteNumberVue: View {
    
    let name: String = "xxx"
    let number: Int = 0770605040
    let maxSwipe: CGFloat = -120
    @State private var offset = CGFloat.zero
    @State private var rotate = false
    @State private var isDelete = false
    
    var body: some View {
        VStack {
            ZStack {
                if !isDelete {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.red)
                        .overlay(
                            Image(systemName: "trash")
                                .foregroundStyle(.white)
                                .font(.system(size: 24))
                                .padding()
                            , alignment: .trailing)
                        .rotation3DEffect(Angle.degrees(rotate ? 60 : 0), axis: (x: 1, y: 0, z: 0))
                        .transition(.opacity)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("\(number)")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 3)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.width < 0 {
                                    offset = value.translation.width
                                    print(value.translation.width)
                                }
                            }
                            .onEnded { value in
                                if value.translation.width <= maxSwipe {
                                    withAnimation(.linear(duration: 1)) {
                                        offset = -UIScreen.main.bounds.width
                                    }
                                    withAnimation(.linear(duration: 1).delay(1)) {
                                        rotate.toggle()
                                    }
                                    withAnimation(.linear(duration: 1).delay(2)) {
                                        isDelete.toggle()
                                    }
                                }else {
                                    withAnimation {
                                        offset = 0
                                    }
                                }
                            }
                    )
            }
        }
        .frame(height: 60)
        .padding(.horizontal)
    }
}

#Preview {
    DeleteNumberVue()
}
