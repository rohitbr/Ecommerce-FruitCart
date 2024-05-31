//
//  FruitCartView.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import SwiftUI

struct FruitCartView: View {
    
    @EnvironmentObject var vm: OrderViewModel
    @State var orderSubmitted = false
    var body: some View {
        NavigationView {
            if (orderSubmitted) {
                SuccessView(config: HUDConfig.success("Order Submitted"), complete: {
                    vm.deleteAllOrders()
                    orderSubmitted.toggle()
                })
            } else if vm.orderList.isEmpty {
                emptyCartView()
            } else {
                fruitCartListView()
            }
        }
    }
    
    // MARK: Helper function
    func onDelete(at offsets: IndexSet) {
        vm.onDelete(at: offsets)
    }
    
    // MARK: View functions
    func emptyCartView() -> some View {
        Text("No Items in the cart!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .navigationTitle("Fruits Cart")
    }
    
    func fruitCartListView() -> some View {
        VStack {
            List {
                ForEach(vm.orderList, id: \.id) { fruit in
                    HStack {
                        FruitListCell(fruit: fruit)
                    }
                }
                .onDelete(perform: onDelete)
            }
            .listStyle(.plain)
            .navigationTitle("Fruits Cart")
            Button {
                orderSubmitted.toggle()
            } label: {
                FruitMainButtonView(title: "Submit Order")
            }
        }
    }
}

struct FruitCartView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCartView()
    }
}
