//
//  PaymentTableViewCell.swift
//  BudgetPlanner
//
//  Created by Admin on 22.12.2021.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    
    let button = UIButton()
    private var leftImageView = UIImageView()
    private var nameOfCategorieLabel = UILabel()
    private var sumLabel = UILabel()
    private var keyNoteLabel = UILabel()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
    func setUp(_ payment: Payment) {
        //button.translatesAutoresizingMaskIntoConstraints = false
        //self.addSubview(button)
        //clipsToBounds = false
        sumLabel.text = "\(payment.sum)p"
        sumLabel.frame = CGRect(x: 300, y: 5, width: 150, height: 40)
        sumLabel.font = UIFont.systemFont(ofSize: 15)
        addSubview(sumLabel)
        
        keyNoteLabel.text = payment.keyNote
        keyNoteLabel.font = UIFont.systemFont(ofSize: 15)

        keyNoteLabel.frame = CGRect(x: 70, y: 50, width: 200, height: 40)
        addSubview(keyNoteLabel)
        
        nameOfCategorieLabel.text = payment.categorieOfPayment?.name
        nameOfCategorieLabel.font = UIFont.systemFont(ofSize: 20)
        nameOfCategorieLabel.frame = CGRect(x: 70, y: 5, width: 200, height: 40)
        //nameOfCategorieLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameOfCategorieLabel)
        
        leftImageView.image = UIImage(named: (payment.categorieOfPayment?.nameOfImage)!)
        leftImageView.clipsToBounds = true
        leftImageView.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
        //leftImageView.clipsToBounds = true
        //leftImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftImageView)
//
//        NSLayoutConstraint.activate([
//            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            leftImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//            leftImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
//            leftImageView.widthAnchor.constraint(equalToConstant: 50),
////            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
////            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            nameOfCategorieLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 20),
//            nameOfCategorieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            nameOfCategorieLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
        
//        NSLayoutConstraint.activate([
//            nameOfCategorieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            nameOfCategorieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
//            nameOfCategorieLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
//            nameOfCategorieLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5)
////            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
////            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
        
        leftImageView.setContentHuggingPriority(.defaultLow + 2, for: .horizontal)
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: topAnchor),
//            button.leadingAnchor.constraint(equalTo: leadingAnchor),
//            button.trailingAnchor.constraint(equalTo: trailingAnchor),
//            button.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
        
       // button.setTitle("\(payment.categorieOfPayment?.name) + 1", for: .normal)
        //button.backgroundColor = .clear
       // button.setTitleColor(.black, for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

