//
//  FruitDetailViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation
import UIKit

class FruitDetailViewController: UIViewController {
  @IBOutlet weak var familyLabel: UILabel!
  @IBOutlet weak var genusLabel: UILabel!
  @IBOutlet weak var nutritionLabel: UILabel!
  
  var selectedFruitProvider: SelectedFruitProvider = SelectedFruit.shared

  // Muy extenso implementar un test para esto. Necesitaría inyectar dependencias…
  // creo que se escaparía al propósito del ejercicio
  override public func viewDidLoad() {
    super.viewDidLoad()
    guard let selectedFruit = selectedFruitProvider.fruit else { return }
    familyLabel.text = "Family: \(selectedFruit.family)"
    genusLabel.text = "Genus: \(selectedFruit.genus)"
    nutritionLabel.text = selectedFruit.getNutritionText()
  }
}
