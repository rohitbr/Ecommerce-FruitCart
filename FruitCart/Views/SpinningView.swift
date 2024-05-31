//
//  SpinningView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/5/24.
//
import SwiftUI

struct SpinningView: View {
    @State private var isSpinning = false

    var body: some View {
        ZStack {
            Image("AnimationCircle")
                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                .rotationEffect(Angle(degrees: isSpinning ? 360.0 : 0.0))
                .animation(.linear(duration: 2)
                    .repeatForever(autoreverses: false))
                .onAppear {
                    isSpinning = true
            }
        }
        .navigationBarBackButtonHidden(true)
    }
 }




struct SpinningView_Previews: PreviewProvider {
    static var previews: some View {
        SpinningView()
    }
}
