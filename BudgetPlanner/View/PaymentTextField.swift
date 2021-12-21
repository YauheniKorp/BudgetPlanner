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
//        addSubview(backgroundView)
//        backgroundView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundView.backgroundColor = .white
//
//        NSLayoutConstraint.activate([
//            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backgroundView.topAnchor.constraint(equalTo: topAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//
//        backgroundView.layer.shadowColor = UIColor.gray.cgColor
//        backgroundView.layer.shadowOpacity = 0.3
//        backgroundView.layer.shadowRadius = 10
//        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 10)
//        backgroundView.layer.cornerRadius = 10
        
        addSubview(paymentView)
        addSubview(categorieTextField)
        addSubview(deleteButton)
        
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        categorieTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButton.setBackgroundImage(UIImage(named: "backspace"), for: .normal)
        //deleteButton.contentMode = .scaleAspectFit
        
        paymentView.contentMode = .scaleAspectFit
        
        
        
        NSLayoutConstraint.activate([
//            paymentView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            paymentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            paymentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            paymentView.widthAnchor.constraint(equalToConstant: 40),
            //paymentView.heightAnchor.constraint(equalToConstant: backgroundView.frame.height),
//            paymentView.trailingAnchor.constraint(equalTo: categorieTextField.leadingAnchor, constant: -10),
//            paymentView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            categorieTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            categorieTextField.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 5),
            categorieTextField.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            categorieTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            //deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            deleteButton.leadingAnchor.constraint(equalTo: categorieTextField.trailingAnchor, constant: 1),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            //deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
        
        ])
        
        categorieTextField.text = "0"
        categorieTextField.clipsToBounds = true
        categorieTextField.layer.cornerRadius = 10
        categorieTextField.backgroundColor = .systemGray6
        categorieTextField.font = UIFont.systemFont(ofSize: 32)
        categorieTextField.adjustsFontSizeToFitWidth = true
        //categorieTextField.text?.max
        categorieTextField.textAlignment = .right
        
//        if let categorieOfPayment = categorieOfPayment {
//            categorieTextField.placeholder =  "Add " + categorieOfPayment.name + " expense"
//            categorieTextField.keyboardType = .phonePad
//            categorieTextField.textAlignment = .right
//            categorieTextField.borderStyle = .roundedRect
//        }
        
        
        
        paymentView.image = UIImage(named: categorieOfPayment!.nameOfImage ?? "")
        
//        paymentView.setContentHuggingPriority(.defaultLow + 2, for: .horizontal)
        
    }
    
//    init(frame: CGRect, categorieOfPayment: Categorie) {
//        super.init(frame: frame)
//        self.categorieOfPayment = categorieOfPayment
//        setView()
//    }
    
    
    init(categorieOfPayment: Categorie, deleteButton: UIButton) {
        super.init(frame: CGRect.zero)
        //super.init()
        self.deleteButton = deleteButton
        self.categorieOfPayment = categorieOfPayment
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//extension UILabel {
//    func maxLength(_ length: Int) {
//        if self.tex
//    }
//}
