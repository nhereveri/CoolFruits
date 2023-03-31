//
//  SelectedFruitTest.swift
//  CoolFruits
//
//  Created by Nelson Hereveri on 31-03-23.
//

import XCTest
@testable import CoolFruits

final class SelectedFruitTest: XCTestCase {
  var fruit1: FruitModel!
  var fruit2: FruitModel!
  
  override func setUp() {
    super.setUp()
    let nutritions1 = NutritionsModel(carbohydrates: 10.0, protein: 0.3, fat: 0.2, calories: 52, sugar: 10.0)
    let nutritions2 = NutritionsModel(carbohydrates: 12.3, protein: 0.2, fat: 0.2, calories: 64, sugar: 17.0)
    
    fruit1 = FruitModel(id: 1, genus: "Malus", name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: nutritions1)
    fruit2 = FruitModel(id: 1, genus: "Prunus", name: "Apricot", family: "Rosaceae", order: "Rosales", nutritions: nutritions2)
  }
  
  override func tearDown() {
    fruit1 = nil
    fruit2 = nil
    super.tearDown()
  }
  
  func testSetFruit() {
    SelectedFruit.shared.setFruit(fruit1)
    XCTAssertNotNil(SelectedFruit.shared.fruit)
    XCTAssertEqual(SelectedFruit.shared.fruit, fruit1)
  }
  
  func testChangeSelectedFruit() {
    SelectedFruit.shared.setFruit(fruit1)
    XCTAssertEqual(SelectedFruit.shared.fruit, fruit1)
    
    SelectedFruit.shared.setFruit(fruit2)
    XCTAssertEqual(SelectedFruit.shared.fruit, fruit2)
  }
}
