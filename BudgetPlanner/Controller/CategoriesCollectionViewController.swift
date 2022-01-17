//
//  CategoriesCollectionViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoriesCollectionViewController: UICollectionViewController {
    
    var currentCells = [UICollectionViewCell]()
    
    let categories = Categories.shared.categories
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CategorieViewController(categorie: categories[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoriesCollectionViewCell
        
        // Configure the cell
        cell.setCell(categories[indexPath.row])
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
        }
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            
        }
    }
}
