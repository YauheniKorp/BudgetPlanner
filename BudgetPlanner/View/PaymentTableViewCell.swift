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
    
    func setUp(_ payment: Payment) {
        
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
        addSubview(nameOfCategorieLabel)
        
        leftImageView.image = UIImage(named: (payment.categorieOfPayment?.nameOfImage)!)
        leftImageView.clipsToBounds = true
        leftImageView.frame = CGRect(x: 5, y: 5, width: 30, height: 30)
        addSubview(leftImageView)
        
        leftImageView.setContentHuggingPriority(.defaultLow + 2, for: .horizontal)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
