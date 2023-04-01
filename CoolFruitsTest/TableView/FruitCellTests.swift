//
//  FruitCellTests.swift
//  FruitModelTest
//
//  Created by Nelson Hereveri on 01-04-23.
//

import XCTest
@testable import CoolFruits

class FruitCellTests: XCTestCase {
  var fruitCell: FruitCell!
  
  override func setUp() {
    super.setUp()
    fruitCell = FruitCell.createCell()
  }
  
  override func tearDown() {
    fruitCell = nil
    super.tearDown()
  }
  
  func testFormattedFruitName() {
    XCTAssertEqual(fruitCell.formattedFruitName(isCitrus: true, fruitName: "Lemon"), " *  Lemon")
    XCTAssertEqual(fruitCell.formattedFruitName(isCitrus: false, fruitName: "Apple"), " Apple")
  }
  
  func testFormattedSugarText() {
    XCTAssertEqual(fruitCell.formattedSugarText(fruitSugar: 10.0), "(Sugar:10.0)")
    XCTAssertEqual(fruitCell.formattedSugarText(fruitSugar: 3.5), "(Sugar:3.5)")
  }
  
  func testSetUp() {
    fruitCell.setUp(fruitName: "Lemon", fruitSugar: 10.0, isCitrus: true)
    XCTAssertEqual(fruitCell.fruitNameLabel.text, " *  Lemon")
    XCTAssertEqual(fruitCell.fruitSugarLabel.text, "(Sugar:10.0)")
    
    fruitCell.setUp(fruitName: "Apple", fruitSugar: 5.0, isCitrus: false)
    XCTAssertEqual(fruitCell.fruitNameLabel.text, " Apple")
    XCTAssertEqual(fruitCell.fruitSugarLabel.text, "(Sugar:5.0)")
  }
}
