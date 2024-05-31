//
//  FruitCartApp.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import SwiftUI

@main
struct FruitCartApp: App {
    var order = OrderViewModel()

    var body: some Scene {
        WindowGroup {
            FruitsTabView()
                .environmentObject(order)
        }
    }
}
