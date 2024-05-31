//
//  OrderViewModel_Tests.swift
//  FruitCartTests
//
//  Created by Bhat, Rohit on 5/29/24.
//

import XCTest
@testable import FruitCart
import Combine

final class OrderViewModel_Tests: XCTestCase {

    private var vm : OrderViewModel?
    private var fruitModel1 : FruitModel?
    private var fruitModel2 : FruitModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = OrderViewModel()
        
        fruitModel1 = FruitModel(name: "Banana", id: 1, family: "", order: "", genus: "", nutritions: Nutritions(calories: 10, fat: 10, sugar: 20, carbohydrates: 20, protein: 20))
        
        fruitModel2 = FruitModel(name: "Orange", id: 2, family: "", order: "", genus: "", nutritions: Nutritions(calories: 10, fat: 10, sugar: 20, carbohydrates: 20, protein: 20))

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }

    func test_orderViewModel_orderList_shouldBeEmptyOnInit() {
        // Then
        guard let vm = vm else {
            XCTFail("VM nil")
            return
        }
        
        XCTAssertTrue(vm.orderList.isEmpty)
    }
    
    
    func test_orderViewModel_addOrder_shouldAddOneOrder() {
        // Given
        
        guard let vm = vm else {
            XCTFail("VM nil")
            return
        }
        
        let fruitModel: FruitModel = FruitModel(name: "Banana", id: 1, family: "", order: "", genus: "", nutritions: Nutritions(calories: 10, fat: 10, sugar: 20, carbohydrates: 20, protein: 20))
        
        vm.addOrder(fruitModel: fruitModel)
        
        XCTAssertFalse(vm.orderList.isEmpty)
        XCTAssertEqual(vm.orderList.count, 1)
        XCTAssertEqual(vm.orderList.first?.id, fruitModel.id)
    }
    
    func test_orderViewModel_addOrder_shouldNotAddOrderIfExists() {
        // Given
        
        guard let vm = vm else {
            XCTFail("VM nil")
            return
        }
        // When
        let fruitModel: FruitModel = FruitModel(name: "Banana", id: 1, family: "", order: "", genus: "", nutritions: Nutritions(calories: 10, fat: 10, sugar: 20, carbohydrates: 20, protein: 20))
        
        vm.addOrder(fruitModel: fruitModel)
        for _ in 0..<10 {
            vm.addOrder(fruitModel: fruitModel)
        }

        // Then
        XCTAssertFalse(vm.orderList.isEmpty)
        XCTAssertEqual(vm.orderList.count, 1)
        XCTAssertEqual(vm.orderList.first?.id, fruitModel.id)
    }
    
    func test_orderViewModel_contains_shouldNotAddOrderIfExists() {
        // Given
        
        guard let vm,
              let fruitModel1,
              let fruitModel2
        else {
            XCTFail("VM nil")
            return
        }
        
        // When
        vm.addOrder(fruitModel: fruitModel1)
        vm.addOrder(fruitModel: fruitModel2)
        
        let fruitModel3 = FruitModel(name: "Banana", id: 3, family: "", order: "", genus: "", nutritions: Nutritions(calories: 10, fat: 10, sugar: 20, carbohydrates: 20, protein: 20))
        
        
        // Then
        
        XCTAssertTrue(vm.containsFruit(fruitModel: fruitModel2))
        XCTAssertTrue(vm.containsFruit(fruitModel: fruitModel1))
        XCTAssertFalse(vm.containsFruit(fruitModel: fruitModel3))
    }
    
    func test_orderViewModel_onDelete_shouldDelete() {
        // Given

        guard let vm,
              let fruitModel1,
              let fruitModel2
        else {
            XCTFail("VM nil")
            return
        }
        
        // When
        vm.addOrder(fruitModel: fruitModel1)
        vm.addOrder(fruitModel: fruitModel2)
        
        let array = [1]
        let indexSet: IndexSet = IndexSet(array)
        vm.onDelete(at: indexSet)
        
        // Then
        XCTAssertTrue(vm.containsFruit(fruitModel: fruitModel1))
        XCTAssertFalse(vm.containsFruit(fruitModel: fruitModel2))
        XCTAssertEqual(vm.orderList.count, 1)
    }
    
    func test_orderViewModel_deleteAllOrders_shouldDeleteAllOrders() {
        // Given

        guard let vm,
              let fruitModel1,
              let fruitModel2
        else {
            XCTFail("VM nil")
            return
        }
        
        // When
        vm.addOrder(fruitModel: fruitModel1)
        vm.addOrder(fruitModel: fruitModel2)
        vm.deleteAllOrders()
        
        
        // Then
        XCTAssertFalse(vm.containsFruit(fruitModel: fruitModel1))
        XCTAssertFalse(vm.containsFruit(fruitModel: fruitModel2))
        XCTAssertTrue(vm.orderList.isEmpty)
        XCTAssertEqual(vm.orderList.count, 0)
    }
}
