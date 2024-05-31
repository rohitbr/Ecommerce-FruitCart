//
//  ContentView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import SwiftUI

struct FruitsTabView: View {
    var body: some View {
        // A view that switches between multiple child views using interactive user interface elements.
        TabView {
            FruitsListView()
                .tabItem {
                    Label("Fruit List", systemImage: "heart.circle")
                }

            FruitCartView()
                .tabItem {
                    Label("Fruit Cart", systemImage: "cart.circle")
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsTabView()
    }
}
