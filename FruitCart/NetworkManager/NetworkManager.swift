//
//  NetworkManager.swift
//  FruitCart
//
//  Created by Bhat, Rohit on 5/3/24.
//

import Foundation
import Combine


class NetworkManager {
    
    private var cancellables = Set<AnyCancellable>()
    static let shared = NetworkManager()

    func getData(url : String) -> AnyPublisher<[FruitModel], Error> {
        return Future<[FruitModel], Error> { promise in
            guard let url = URL(string: url) else {
                promise(.failure(URLError(.badURL)))
                return
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                          httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: [FruitModel].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: {
                    print ("Received completion: \($0).")
                    switch $0 {
                    case .failure(let error):
                        promise(.failure(error))
                    default:
                        break
                    }
                },
                      receiveValue: { promise(.success($0))})
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
}
