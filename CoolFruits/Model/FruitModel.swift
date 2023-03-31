//
//  FruitModel.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation

protocol Identifiable {
  var id: Int { get }
}

protocol Taxonomy {
  var genus: String { get }
  var name: String { get }
  var family: String { get }
  var order: String { get }
}

protocol Nutritional {
  var nutritions: NutritionsModel { get }
}

struct FruitModel: Identifiable, Taxonomy, Nutritional, Codable {
  let id: Int
  let genus: String
  let name: String
  let family: String
  let order: String
  let nutritions: NutritionsModel
  
  enum CodingKeys: String, CodingKey {
    case id, genus, name, family, order, nutritions
  }
}

struct NutritionsModel: Codable {
  let carbohydrates: Double
  let protein: Double
  let fat: Double
  let calories: Int
  let sugar: Double
  
  enum CodingKeys: String, CodingKey {
    case carbohydrates, protein, fat, calories, sugar
  }
}
