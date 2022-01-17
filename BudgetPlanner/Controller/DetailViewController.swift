//
//  DetailViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 13.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var payment: Payment
    
    let mainLabel: UILabel = {
        let label = UILabel()
        let attributString = NSMutableAttributedString(string: "Detail", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0)])
        label.attributedText = attributString
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let categorieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let keynoteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let methodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(categorieLabel)
        self.view.addSubview(sumLabel)
        self.view.addSubview(keynoteLabel)
        self.view.addSubview(methodLabel)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        guard let indexOfMethodOfPayment = CheckArr.shared.array.last else {return}
        
        let attributStringForDateLabel = NSMutableAttributedString(string: "Date: ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.gray.cgColor])
        attributStringForDateLabel.append(NSAttributedString(string: "\(dateFormatter.string(from: payment.date))", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.black.cgColor]))
        dateLabel.attributedText = attributStringForDateLabel
        
        let attributStringForCategorieLabel = NSMutableAttributedString(string: "Categorie: ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.gray.cgColor])
        attributStringForCategorieLabel.append(NSAttributedString(string: "\(String(describing: payment.categorieOfPayment!.name!))", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.black.cgColor]))
        categorieLabel.attributedText = attributStringForCategorieLabel
        
        let attributStringForSumLabel = NSMutableAttributedString(string: "Payment sum: ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.gray.cgColor])
        attributStringForSumLabel.append(NSAttributedString(string: "\(payment.sum)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.black.cgColor]))
        sumLabel.attributedText = attributStringForSumLabel
        
        let attributStringForKeynoteLabel = NSMutableAttributedString(string: "Keynote: ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.gray.cgColor])
        
        if payment.keyNote.isEmpty {
            payment.keyNote = "None"
        }
        attributStringForKeynoteLabel.append(NSAttributedString(string: "\(payment.keyNote)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.black.cgColor]))
        keynoteLabel.attributedText = attributStringForKeynoteLabel
        
        let attributStringForMethodLabel = NSMutableAttributedString(string: "Method of payment is: ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.gray.cgColor])
        attributStringForMethodLabel.append(NSAttributedString(string: "\(OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethodOfPayment].nameOfMethod)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0), .foregroundColor: UIColor.black.cgColor]))
        methodLabel.attributedText = attributStringForMethodLabel
        
        setUpConstraints()
    }
    
    init(payment: Payment) {
        self.payment = payment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailViewController {
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 100),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            categorieLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30),
            categorieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categorieLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categorieLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            sumLabel.topAnchor.constraint(equalTo: categorieLabel.bottomAnchor, constant: 30),
            sumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sumLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            keynoteLabel.topAnchor.constraint(equalTo: sumLabel.bottomAnchor, constant: 30),
            keynoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            keynoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            keynoteLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            methodLabel.topAnchor.constraint(equalTo: keynoteLabel.bottomAnchor, constant: 30),
            methodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            methodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            methodLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
