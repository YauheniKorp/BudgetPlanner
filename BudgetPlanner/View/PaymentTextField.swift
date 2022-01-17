//
//  AddingPaymentView.swift
//  BudgetPlanner
//
//  Created by Admin on 12.10.2021.
//

import UIKit

class PaymentTextField: UIView {
    
    var textFieldPlaceHolder: String?
    
    var paymentView = UIImageView()
    var categorieTextField = UILabel()
    var deleteButton = UIButton()
    var categorieOfPayment: Categorie?
    
    
    func setView() {
        clipsToBounds = true
        
        addSubview(paymentView)
        addSubview(categorieTextField)
        addSubview(deleteButton)
        
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        categorieTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setBackgroundImage(UIImage(named: "backspace"), for: .normal)
        paymentView.contentMode = .scaleAspectFit
        
        
        
        NSLayoutConstraint.activate([
            paymentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            paymentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            paymentView.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            categorieTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieTextField.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 5),
            categorieTextField.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            categorieTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            
        ])
        
        categorieTextField.text = "0"
        categorieTextField.clipsToBounds = true
        categorieTextField.layer.cornerRadius = 10
        categorieTextField.backgroundColor = .systemGray6
        categorieTextField.font = UIFont.systemFont(ofSize: 32)
        categorieTextField.adjustsFontSizeToFitWidth = true
        categorieTextField.textAlignment = .right
        
        paymentView.image = UIImage(named: categorieOfPayment!.nameOfImage ?? "")
        
    }
    
    init(categorieOfPayment: Categorie, deleteButton: UIButton) {
        super.init(frame: CGRect.zero)
        self.deleteButton = deleteButton
        self.categorieOfPayment = categorieOfPayment
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
