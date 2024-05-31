//
//  NetworkManager_Tests.swift
//  FruitCartTests
//
//  Created by Bhat, Rohit on 5/30/24.
//

import XCTest
@testable import FruitCart
import Combine

final class NetworkManager_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getData_networkManager() {
        var cancellables = Set<AnyCancellable>()

        let networkManager = NetworkManager.shared
        
        let result = networkManager.getData(url: "https://www.fruityvice.com/api/fruit/all")
        
        let expectation = XCTestExpectation(description: "test Should return result")
        
        var fruitModelList : [FruitModel] = []
        
        result
            .sink(receiveCompletion: { completation in
                switch completation {
                case .failure(_):
                    break
                case .finished:
                    expectation.fulfill()
                }
                
            }, receiveValue: { fruitmodel in
                fruitModelList = fruitmodel
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertFalse(fruitModelList.isEmpty)
    }
    
    func test_getData_networkManager_shouldFail() {
        var cancellables = Set<AnyCancellable>()

        let networkManager = NetworkManager.shared
        
        let result = networkManager.getData(url: "https://www.fruityvice1232112.com/api/fruit/all")
        
        let expectation = XCTestExpectation(description: "test Should return result")
        
        var fruitModelList : [FruitModel] = []
        
        result
            .sink(receiveCompletion: { completation in
                switch completation {
                case .failure(_):
                    expectation.fulfill()
                    break
                case .finished:
                    break
                }
                
            }, receiveValue: { fruitmodel in
                fruitModelList = fruitmodel
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 30)
        
        XCTAssertTrue(fruitModelList.isEmpty)
    }

}
