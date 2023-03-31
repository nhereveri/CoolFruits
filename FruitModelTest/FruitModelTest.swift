//
//  FruitModelTest.swift
//  FruitModelTest
//
//  Created by Nelson Hereveri on 30-03-23.
//

import XCTest
@testable import CoolFruits

final class FruitModelTest: XCTestCase {
  
  let jsonResponse = """
  [
    {
      "genus": "Malus",
      "name": "Apple",
      "id": 6,
      "family": "Rosaceae",
      "order": "Rosales",
      "nutritions": {
        "carbohydrates": 11.4,
        "protein": 0.3,
        "fat": 0.4,
        "calories": 52,
        "sugar": 10.3
      }
    },
    {
      "genus": "Prunus",
      "name": "Apricot",
      "id": 35,
      "family": "Rosaceae",
      "order": "Rosales",
      "nutritions": {
        "carbohydrates": 3.9,
        "protein": 0.5,
        "fat": 0.1,
        "calories": 15,
        "sugar": 3.2
      }
    }
  ]
  """
  
  func testFruitModelJSONDecodingEncoding() {
    let jsonData = Data(jsonResponse.utf8)
    let decoder = JSONDecoder()
    var fruits: [FruitModel] = []
    
    XCTAssertNoThrow(try decoder.decode([FruitModel].self, from: jsonData), "La decodificación ha fallado")
    
    do {
      fruits = try decoder.decode([FruitModel].self, from: jsonData)
    } catch {
      print("Decodificación fallida: \(error)")
    }
    
    // Codificar nuevamente a JSON
    let encoder = JSONEncoder()
    var encodedData: Data?
    
    XCTAssertNoThrow(try encoder.encode(fruits), "Codificación fallida")
    
    do {
      encodedData = try encoder.encode(fruits)
    } catch {
      print("Error de codificación: \(error)")
    }
    
    XCTAssertNotNil(encodedData, "El dato codificado no puede ser nulo")
    
    // Comparar el JSON decodificado y codificado
    if let data = encodedData {
      let encodedJSON = String(data: data, encoding: .utf8)
      XCTAssertNotNil(encodedJSON, "El JSON codificado no puede ser nulo")
      
      // TODO: Los JSON no son iguales en formato string. Habría que comparar cada atributo o una librería que compare JSON…
      // let decodedJSON = String(data: jsonData, encoding: .utf8)
      // XCTAssertTrue(encodedJSON, decodedJSON, "Encoded JSON should match the original JSON")
    }
  }
  
  func testFruitModelProtocolConformance() {
    // Crear un objeto NutritionsModel
    let nutritions = NutritionsModel(carbohydrates: 15.0, protein: 0.3, fat: 0.2, calories: 52, sugar: 10.0)
    
    // Crear un objeto FruitModel
    let fruit = FruitModel(id: 1, genus: "Malus", name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: nutritions)
    
    // Verificar que el objeto FruitModel cumple con Identifiable
    XCTAssertTrue(fruit is Identifiable, "FruitModel does not conform to Identifiable")
    
    // Verificar que el objeto FruitModel cumple con Taxonomy
    XCTAssertTrue(fruit is Taxonomy, "FruitModel does not conform to Taxonomy")
    
    // Verificar que el objeto FruitModel cumple con Nutritional
    XCTAssertTrue(fruit is Nutritional, "FruitModel does not conform to Nutritional")
  }
  
  func testFruitModelPropertyValues() {
    // Crear un objeto NutritionsModel
    let nutritions = NutritionsModel(carbohydrates: 15.0, protein: 0.3, fat: 0.2, calories: 52, sugar: 10.0)
    
    // Crear un objeto FruitModel
    let fruit = FruitModel(id: 1, genus: "Malus", name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: nutritions)
    
    // Verificar los valores de las propiedades de FruitModel
    XCTAssertEqual(fruit.id, 1, "FruitModel id property value is incorrect")
    XCTAssertEqual(fruit.genus, "Malus", "FruitModel genus property value is incorrect")
    XCTAssertEqual(fruit.name, "Apple", "FruitModel name property value is incorrect")
    XCTAssertEqual(fruit.family, "Rosaceae", "FruitModel family property value is incorrect")
    XCTAssertEqual(fruit.order, "Rosales", "FruitModel order property value is incorrect")
    
    // Verificar los valores de las propiedades de NutritionsModel
    XCTAssertEqual(fruit.nutritions.carbohydrates, 15.0, "NutritionsModel carbohydrates property value is incorrect")
    XCTAssertEqual(fruit.nutritions.protein, 0.3, "NutritionsModel protein property value is incorrect")
    XCTAssertEqual(fruit.nutritions.fat, 0.2, "NutritionsModel fat property value is incorrect")
    XCTAssertEqual(fruit.nutritions.calories, 52, "NutritionsModel calories property value is incorrect")
    XCTAssertEqual(fruit.nutritions.sugar, 10.0, "NutritionsModel sugar property value is incorrect")
  }
}
