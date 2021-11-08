//
//  CardView.swift
//  BudgetPlanner
//
//  Created by Admin on 06.10.2021.
//

import UIKit

class CardView: UIView {

    private var label = UILabel()

    var card: PaymentMethod?
    
    private var imageOfCard = UIImageView()
    
    func configureView(_ card: PaymentMethod) {
        
        self.addSubview(label)
        self.addSubview(imageOfCard)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .systemGray6
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        imageOfCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageOfCard.topAnchor.constraint(equalTo: topAnchor),
            imageOfCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            imageOfCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            imageOfCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: imageOfCard.bottomAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 45),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ])
        
        backgroundColor = .clear
        
        label.text = " " + card.nameOfMethod
        label.textColor = .systemGray
        
        imageOfCard.image = UIImage(named: card.nameOfImage)
        
    }
    
    init(frame: CGRect, card: PaymentMethod) {
        super.init(frame: frame)
        self.card = card
        translatesAutoresizingMaskIntoConstraints = false
        configureView(card)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
