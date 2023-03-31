//
//  FruitDetailViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation
import UIKit

public class FruitDetailViewController: UIViewController {
  @IBOutlet weak var familyLabel: UILabel!
  @IBOutlet weak var genusLabel: UILabel!
  @IBOutlet weak var nutritionLabel: UILabel!
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    familyLabel.text = "Family: \(SelectedFruit.shared.fruit!.family)"
    genusLabel.text = "Genus: \(SelectedFruit.shared.fruit!.genus)"
    nutritionLabel.text = getNutritionText(selectedFruit: SelectedFruit.shared.fruit!)
  }
  
  
  func getNutritionText(selectedFruit: FruitModel) -> String {
    var text = String()
    text += "Sugar: " + String(selectedFruit.nutritions.sugar)
    text += "\n"
    text += "Calories: " + String(selectedFruit.nutritions.calories)
    text += "\n"
    text += "Fat: " + String(selectedFruit.nutritions.fat)
    return text
  }
}

