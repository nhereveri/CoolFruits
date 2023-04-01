//
//  ViewModel.swift
//  CoolFruits
//
//  Created by Nelson Hereveri on 01-04-23.
//

import UIKit

extension ViewController {
  // En lo posible todos los ViewModel se llamen igual desde el ViewController
  public class ViewModel {
    var fruits: [FruitModel?] = []
    
    private let dataProvider: FruitDataProvider
    private let lock = NSLock()
    
    init(dataProvider: FruitDataProvider) {
      self.dataProvider = dataProvider
    }
    
    func loadFruits(completion: @escaping () -> Void) {
      dataProvider.getAllFruits { fruits, error in
        if let fruits = fruits {
          self.lock.lock()
          self.fruits = fruits // sección crítica
          self.lock.unlock()
        }
        completion()
      }
    }
  }
}
