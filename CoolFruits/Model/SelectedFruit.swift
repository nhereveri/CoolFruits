//
//  SelectedFruit.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation

class SelectedFruit {
    private(set) static var fruit: FruitModel?
    
    private init() {
    }
    
    static func setFruit(_ fruit: FruitModel) {
        self.fruit = fruit
    }
}
