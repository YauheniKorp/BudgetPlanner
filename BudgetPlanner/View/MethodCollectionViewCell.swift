//
//  MethodCollectionViewCell.swift
//  BudgetPlanner
//
//  Created by Admin on 18.01.2022.
//

import UIKit

class MethodCollectionViewCell: UICollectionViewCell {
   
    var paymentMethod: PaymentMethod?
    
    private var label = UILabel()
    private var imageOfCard = UIImageView()
    
    func setCell(_ methodOfPayment: PaymentMethod) {
        
        self.paymentMethod = methodOfPayment
        self.addSubview(label)
        self.addSubview(imageOfCard)
        
        if methodOfPayment.nameOfMethod != "My Card" && methodOfPayment.nameOfMethod != "My Cash" {
            backgroundColor = .systemGray3
        } else {
            backgroundColor = .systemGray5
        }
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .systemGray6
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        imageOfCard.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageOfCard.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageOfCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfCard.widthAnchor.constraint(equalToConstant: frame.size.width * 0.35),
            imageOfCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageOfCard.bottomAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 45),
            label.widthAnchor.constraint(equalTo: imageOfCard.widthAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        label.text = " " + methodOfPayment.nameOfMethod
        label.textColor = .systemGray
        
        imageOfCard.image = UIImage(named: methodOfPayment.nameOfImage)
    }
}
