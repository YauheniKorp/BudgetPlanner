//
//  TextFieldViewRegistration.swift
//  BudgetPlanner
//
//  Created by Admin on 16.12.2021.
//

import Foundation
import UIKit

class TextFieldView: UIView {

    private var backgroundView = UIView()
    private var leftImageView = UIImageView()
    var inputTextField = UITextField()
    
    var clos: ((String) -> Void) = { _ in }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        clipsToBounds = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundView)
        backgroundView.backgroundColor = .white

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        backgroundView.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        backgroundView.layer.shadowOpacity = 0.03
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 10)
        backgroundView.layer.cornerRadius = 10
        
        leftImageView.image = UIImage(named: imageName)
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftImageView)
        
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
        addSubview(inputTextField)
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextField.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 20),
            inputTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        leftImageView.setContentHuggingPriority(.defaultLow + 2, for: .horizontal)
        
        inputTextField.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
    }
    
    @objc private func textChange(_ sender: UITextField) {
        clos(sender.text ?? "")
    }
    
    
    var imageName = "" {
        didSet {
            leftImageView.image = UIImage(named: imageName)
        }
    }
    
    var placeHolder = "" {
        didSet {
            inputTextField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor : UIColor(named: "GrayColor") as Any])
        }
    }
}
