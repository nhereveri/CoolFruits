//
//  ViewController.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 12-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import UIKit

public class HomeViewModel {
  var fruits: [FruitModel?] = []
  
  private let dataProvider: FruitDataProvider
  
  init(dataProvider: FruitDataProvider) {
    self.dataProvider = dataProvider
  }
  
  func loadFruits(completion: @escaping () -> Void) {
    dataProvider.getAllFruits { fruits, error in
      if let fruits = fruits {
        self.fruits = fruits
      }
      completion()
    }
  }
}

class ViewController: UIViewController {
  
  var viewModel: HomeViewModel = HomeViewModel(dataProvider: RequestManager.shared)
  var selectedFruit: FruitModel?
  @IBOutlet weak var fruitsTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.fruitsTableView.register(UINib.init(nibName: "CounterCellView", bundle: nil), forCellReuseIdentifier: "counterCell")
    self.fruitsTableView.delegate = self
    self.fruitsTableView.dataSource = self
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationController?.navigationBar.topItem?.title = "Fruitspedia"
    self.navigationController?.navigationBar.tintColor = UIColor.black
    
    viewModel.loadFruits {
      DispatchQueue.main.async {
        self.fruitsTableView.reloadData()
      }
    }
  }
  
  func navigateToDetail(nibName: String) {
    let vc = FruitDetailViewController(nibName: nibName, bundle: nil)
    vc.title = SelectedFruit.shared.fruit?.name
    if let navigator = navigationController {
      navigator.pushViewController(vc, animated: true)
    }
  }
}



extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.fruits.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell") as? FruitCell
    
    if cell == nil {
      cell = FruitCell.createCell()
    }
    cell!.setUp(fruitName: viewModel.fruits[indexPath.row]?.name, fruitSugar: viewModel.fruits[indexPath.row]?.nutritions.sugar, isCitrus: viewModel.fruits[indexPath.row]?.genus == "Citrus")
    return cell!
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // Preguntamos si cumple el protocolo FruitModel y luego usamos el setter
    if let selectedFruit = viewModel.fruits[indexPath.row] {
      SelectedFruit.shared.setFruit(selectedFruit)
    }
    if SelectedFruit.shared.fruit?.genus == "Citrus" {
      navigateToDetail(nibName: "FruitDetailCitrusViewController")
    } else {
      navigateToDetail(nibName: "FruitDetailViewController")
    }
  }
}
