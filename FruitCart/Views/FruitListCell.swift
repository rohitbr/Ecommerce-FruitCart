//
//  FruitListCell.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/5/24.
//

import SwiftUI

struct FruitListCell : View {
    let fruit: FruitModel
    var itemInCart : Bool = false
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                getSafeImage(named: fruit.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 80)

                    itemInCart ? Image(systemName: "cart.circle.fill") : nil
            }
                

            VStack(alignment: .leading, spacing: 15) {
                Text(fruit.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Family: " + fruit.family)
                    .font(.caption)
            }
            .padding(.leading)
            
            Spacer()
        }
    }
    
    func getSafeImage(named: String) -> Image {
        let uiImage =  (UIImage(named: named) ?? UIImage(named: "Default.png"))!
        return Image(uiImage: uiImage)
    }
}

struct FruitListCell_Previews: PreviewProvider {
    static var previews: some View {
        FruitListCell(fruit: MockData.fruitModelApple, itemInCart: true)
    }
}
