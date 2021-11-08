//
//  CategoriesCollectionViewCell.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    let imageOfCategories = UIImageView()
    let nameOfCategoris = UILabel()
    
    func setCell(_ categorie: Categorie) {
        
        addSubview(imageOfCategories)
        addSubview(nameOfCategoris)
        
        imageOfCategories.translatesAutoresizingMaskIntoConstraints = false
        imageOfCategories.contentMode = .scaleAspectFit
        imageOfCategories.image = UIImage(named: categorie.nameOfImage)
        
        nameOfCategoris.translatesAutoresizingMaskIntoConstraints = false
        nameOfCategoris.textAlignment = .center
        nameOfCategoris.layer.cornerRadius = 5
        nameOfCategoris.backgroundColor = .systemGray6
        nameOfCategoris.clipsToBounds = true
        nameOfCategoris.textColor = .systemGray
        nameOfCategoris.text = categorie.name
        nameOfCategoris.font = UIFont.systemFont(ofSize: 15)
        
        
        NSLayoutConstraint.activate([
            imageOfCategories.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            imageOfCategories.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageOfCategories.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageOfCategories.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1 * frame.size.height * 0.3)
        ])
        
        NSLayoutConstraint.activate([
            nameOfCategoris.topAnchor.constraint(equalTo: imageOfCategories.bottomAnchor, constant: frame.size.height * 0.05),
            nameOfCategoris.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameOfCategoris.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameOfCategoris.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        
    }
    
    
}
