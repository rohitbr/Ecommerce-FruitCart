//
//  Order.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/6/24.
//

import Foundation
import Combine
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published private (set) var orderList: [FruitModel] = []

    func addOrder(fruitModel: FruitModel) {
        if !containsFruit(fruitModel: fruitModel) {
            orderList.append(fruitModel)
        }
    }

    func containsFruit(fruitModel: FruitModel) -> Bool {
        let matchingFruit = orderList.firstIndex(where: {$0.id == fruitModel.id})
        let returnVal = (matchingFruit != nil) ?  true :  false
        return returnVal
    }
    
    func onDelete(at offsets: IndexSet) {
        orderList.remove(atOffsets: offsets)
    }
    
    func deleteAllOrders() {
        orderList.removeAll()
    }
}

