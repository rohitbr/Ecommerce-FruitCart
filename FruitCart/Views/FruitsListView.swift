//
//  FruitsListView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import SwiftUI
import Combine

struct FruitsListView: View {
    @StateObject var fruitListVm = FruitListViewModel()
    @EnvironmentObject var orderVm: OrderViewModel

    var body: some View {
        ZStack {
            NavigationView {
                if fruitListVm.isLoading {
                    SpinningView()
                } else {
                    List(fruitListVm.fruitListModel, id: \.id) { fruit in
                        FruitListCell(fruit: fruit, itemInCart: orderVm.containsFruit(fruitModel: fruit))
                            .onTapGesture {
                                fruitListVm.showDetailView = true
                                fruitListVm.selectedFruit = fruit
                            }
                    }
                    .listStyle(.plain)
                    .blur(radius: fruitListVm.showDetailView ? 40 : 0)
                    .disabled(fruitListVm.showDetailView ? true : false)
                    .navigationTitle("Fruits List")
                }
            }
            .onAppear {
                fruitListVm.getData()
            }
            if fruitListVm.showDetailView {
                FruitDetailView(showDetail: $fruitListVm.showDetailView, fruit: fruitListVm.selectedFruit ?? MockData.fruitModelBanana)
            }
        }
    }
}


struct FruitsListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsListView()
    }
}
