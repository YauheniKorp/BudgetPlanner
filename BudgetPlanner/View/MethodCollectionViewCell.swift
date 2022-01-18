//
//  MethodCollectionViewCell.swift
//  BudgetPlanner
//
//  Created by Admin on 18.01.2022.
//

import UIKit

class MethodCollectionViewCell: UICollectionViewCell {
            
    var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var paymentMethod: PaymentMethod?
    
    private var label = UILabel()
    private var imageOfCard = UIImageView()
    
    func setCell(_ methodOfPayment: PaymentMethod) {
        
        self.paymentMethod = methodOfPayment
        self.addSubview(label)
        self.addSubview(imageOfCard)
        
        if methodOfPayment.nameOfMethod != "My Card" && methodOfPayment.nameOfMethod != "My Cash" {
            addSubview(deleteButton)
            
            NSLayoutConstraint.activate([
                imageOfCard.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                imageOfCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                imageOfCard.widthAnchor.constraint(equalToConstant: frame.size.width * 0.35),
                imageOfCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70)
            ])
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: imageOfCard.bottomAnchor, constant: 5),
                label.heightAnchor.constraint(equalToConstant: 45),
                label.widthAnchor.constraint(equalTo: imageOfCard.widthAnchor),
                label.leadingAnchor.constraint(equalTo: imageOfCard.leadingAnchor)
            ])
            
            NSLayoutConstraint.activate([
                deleteButton.topAnchor.constraint(equalTo: label.topAnchor),
                deleteButton.heightAnchor.constraint(equalToConstant: 45),
                deleteButton.leadingAnchor.constraint(equalTo: imageOfCard.trailingAnchor, constant: 25),
                deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ])
            
            deleteButton.addTarget(self, action: #selector(asd), for: .touchUpInside)
        }
   
        backgroundColor = .systemYellow
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
            imageOfCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageOfCard.widthAnchor.constraint(equalToConstant: frame.size.width * 0.35),
            imageOfCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageOfCard.bottomAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 45),
            label.widthAnchor.constraint(equalTo: imageOfCard.widthAnchor),
            label.leadingAnchor.constraint(equalTo: imageOfCard.leadingAnchor)
        ])

        label.text = " " + methodOfPayment.nameOfMethod
        label.textColor = .systemGray
        
        imageOfCard.image = UIImage(named: methodOfPayment.nameOfImage)
    }
    
    @objc
    func asd() {
        for indexOfMethod in OneAndOnlyUser.shared.user.methodsOfPayment!.indices {
            if OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].nameOfMethod == paymentMethod?.nameOfMethod {
                print("\(OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].nameOfMethod)")
                OneAndOnlyUser.shared.user.methodsOfPayment!.remove(at: indexOfMethod)
                CheckArr.shared.array.append(0)
            }
        }
    }
    
    
}
