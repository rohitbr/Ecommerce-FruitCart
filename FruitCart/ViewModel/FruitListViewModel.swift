//
//  FruitListViewModel.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/4/24.
//

import Foundation
import Combine
import SwiftUI

class FruitListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var fruitListModel = [FruitModel]()
    @Published var showDetailView = false
    @Published var selectedFruit: FruitModel?
    @Published var isLoading = false
    
    func getData() {
        isLoading = true
        NetworkManager.shared.getData(url: "https://www.fruityvice.com/api/fruit/all")
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] response in
                self?.isLoading = false
                self?.fruitListModel = response
            }
            .store(in: &cancellables)
        }
 
}
