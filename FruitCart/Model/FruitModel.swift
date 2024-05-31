//
//  FruitModel.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//


//{
//   "name": "Ceylon Gooseberry",
//   "id": 104,
//   "family": "Salicaceae",
//   "order": "Malpighiales",
//   "genus": "Dovyalis",
//   "nutritions": {
//     "calories": 47,
//     "fat": 0.3,
//     "sugar": 8.1,
//     "carbohydrates": 9.6,
//     "protein": 1.2
//   }
// }

import Foundation

struct FruitModelList : Codable {
    let fruitList : [FruitModel]
}


// MARK: - AlbumElement
struct FruitModel: Codable {
    let name: String
    let id: Int
    let family, order, genus: String
    let nutritions: Nutritions
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let calories: Int
    let fat, sugar, carbohydrates, protein: Double
}

struct MockData {
    static let fruitModelApple = FruitModel(name: "Apple", id: 104,  family: "Salicaceae", order: "Malpighiales", genus: "Dovyalis", nutritions: Nutritions(calories: 10, fat: 30, sugar: 40, carbohydrates: 40, protein: 40))
    
    static let fruitModelBanana = FruitModel(name: "Banana", id: 105,  family: "Salicaceae", order: "Malpighiales", genus: "Dovyalis", nutritions: Nutritions(calories: 10, fat: 30, sugar: 40, carbohydrates: 40, protein: 40))
    
    static let fruitModelList = FruitModelList(fruitList: [fruitModelApple, fruitModelBanana])
}
