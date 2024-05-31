//
//  FruitDetailView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/4/24.
//

import SwiftUI

struct FruitDetailView: View {
    
    @Binding var showDetail: Bool
    @EnvironmentObject var order: OrderViewModel
    @State var disableButton = false
    let fruit: FruitModel
    
    var body: some View {
            VStack {
                
                imageWithXButton()
                
                VStack(spacing : 20) {
                    Text(fruit.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(fruit.genus)
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    HStack (spacing: 25) {
                        NutritionHeadingWithValues(heading: "Calories", value: fruit.nutritions.calories)
                        NutritionHeadingWithValues(heading: "Sugar", value: Int(fruit.nutritions.sugar))
                        NutritionHeadingWithValues(heading: "Protein", value: Int(fruit.nutritions.protein))
                    }
                    
                    Button() {
                        order.addOrder(fruitModel: fruit)
                        showDetail.toggle()
                       
                    } label: {
                        disableButton ?
                        FruitMainButtonView(title: "\(fruit.name) already added")
                                        :
                        FruitMainButtonView(title: "Add \(fruit.name) to cart")
                    }
                    .disabled(disableButton)
                    .opacity(disableButton ? 0.7 : 1.0)
                    
                }
                Spacer()
            }
            .onAppear {
                if order.containsFruit(fruitModel: fruit) {
                    disableButton = true
                }
            }
            .frame(width: 300, height:540)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 40)
    }
    
    // MARK: Views
    func xButton() -> some View {
        Button(action: {
            withAnimation {
                showDetail.toggle()
            }
        }, label: {
            Image(systemName: "xmark.circle")
                .foregroundColor(.black)
        }).padding()
    }
    
    func imageWithXButton() -> some View {
        ZStack {
            Image(fruit.name)
                .resizable()
            .aspectRatio(contentMode: .fit)
            
            HStack {
                Spacer()
                VStack {
                    xButton()
                    Spacer()
                }
            }
        }
    }
        
}

struct NutritionHeadingWithValues : View {
    let heading: String
    let value: Int
    var body: some View {
        VStack {
            Text(heading)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            Text("\(value)")
                .font(.caption)
                .italic()
        }
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(showDetail: .constant(true), fruit: MockData.fruitModelBanana)
    }
}
