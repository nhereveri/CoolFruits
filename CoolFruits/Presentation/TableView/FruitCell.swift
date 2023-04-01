//
//  FruitCell.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 19-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation
import UIKit

public class FruitCell: UITableViewCell {
  @IBOutlet weak var fruitNameLabel: UILabel!
  @IBOutlet weak var fruitSugarLabel: UILabel!
  
  public override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  public func setUp(fruitName: String?, fruitSugar: Double?, isCitrus: Bool) {
    guard let fruitName = fruitName, let fruitSugar = fruitSugar else {
      return
    }
    
    fruitNameLabel.text = formattedFruitName(isCitrus: isCitrus, fruitName: fruitName)
    fruitSugarLabel.text = formattedSugarText(fruitSugar: fruitSugar)
  }
}

extension FruitCell {
  func formattedFruitName(isCitrus: Bool, fruitName: String) -> String {
    return "\(isCitrus ? " * " : "") \(fruitName)"
  }
  
  func formattedSugarText(fruitSugar: Double) -> String {
    return "(Sugar:" + String(fruitSugar) + ")"
  }
  
  class func createCell() -> FruitCell? {
    let nib = UINib(nibName: "FruitCell", bundle: nil)
    let cell = nib.instantiate(withOwner: self, options: nil).last as? FruitCell
    return cell
  }
}
