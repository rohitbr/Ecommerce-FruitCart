//
//  FruitMainButtonView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/5/24.
//

import SwiftUI

struct FruitMainButtonView: View {
    var title : String
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.accentColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

struct FruitMainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FruitMainButtonView(title: "Add Apple to Cart")
    }
}
