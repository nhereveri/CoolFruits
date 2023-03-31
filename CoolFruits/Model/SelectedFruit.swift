//
//  SelectedFruit.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation

class SelectedFruit {
  // Explicitando la implementación de Singleton
  static let shared = SelectedFruit()
  private(set) var fruit: FruitModel?
  private static let lock = NSLock()
  
  private init() {}
  
  func setFruit(_ fruit: FruitModel) {
    SelectedFruit.lock.lock()
    defer {
      SelectedFruit.lock.unlock()
    }
    self.fruit = fruit // sección crítica que necesita ser controlada
  }
}
