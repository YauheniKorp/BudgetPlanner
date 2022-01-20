//
//  NewMethodViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 03.01.2022.
//

import UIKit

class NewMethodViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attText = NSMutableAttributedString(string: "Create new method of payment", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)])
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.backgroundColor = .systemGray3
        label.layer.cornerRadius = 10
        label.attributedText = attText
        return label
    }()
    
    private let labelOfTextField: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attText = NSMutableAttributedString(string: "Write the name of method:", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)])
        label.attributedText = attText
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name of method"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let nameOfMethodInSegment: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attText = NSMutableAttributedString(string: "Choose type of method:", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)])
        label.attributedText = attText
        return label
    }()
    
    private let methodSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Cash", "Card"])
        segment.selectedSegmentIndex = 0
        segment.setWidth(100, forSegmentAt: 0)
        segment.setWidth(100, forSegmentAt: 1)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Create", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.view.addSubview(labelOfTextField)
        self.view.addSubview(titleLabel)
        self.view.addSubview(methodSegment)
        self.view.addSubview(nameOfMethodInSegment)
        self.view.addSubview(nameTextField)
        self.view.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            labelOfTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            labelOfTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelOfTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelOfTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: labelOfTextField.bottomAnchor, constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            nameOfMethodInSegment.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            nameOfMethodInSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameOfMethodInSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameOfMethodInSegment.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            methodSegment.topAnchor.constraint(equalTo: nameOfMethodInSegment.bottomAnchor, constant: 10),
            methodSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            methodSegment.heightAnchor.constraint(equalToConstant: 45),
            methodSegment.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        createButton.addTarget(self, action: #selector(createNewMethod), for: .touchUpInside)
    }
    
    @objc
    func createNewMethod() {
        if nameTextField.text != "" {
            let indexOfSegment = methodSegment.selectedSegmentIndex
            switch indexOfSegment {
            case 0:
                searchTheSameNameOfMethod(.cash)
            case 1:
                searchTheSameNameOfMethod(.card)
            default:
                print("error")
            }
        }
    }
    
    enum PaymentMethodEnum: String {
        case card = "Card"
        case cash = "Cash"
    }
    
    func searchTheSameNameOfMethod(_ method: PaymentMethodEnum) {
        switch method {
            
        case .card:
            var count = 0
            for value in OneAndOnlyUser.shared.user.methodsOfPayment! {
                if value.nameOfMethod == nameTextField.text! {
                    count += 1
                    let alertVC = UIAlertController(title: "Error", message: "This name already exists, please enter another name!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)
                    alertVC.addAction(okAction)
                    present(alertVC, animated: true)
                }
            }
            if count < 1 {
                let newMethod = PaymentMethod(nameOfImage: "card", nameOfMethod: "\(nameTextField.text!)", payments: [])
                OneAndOnlyUser.shared.user.methodsOfPayment?.append(newMethod)
                let vc = ViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        case .cash:
            var count = 0
            for value in OneAndOnlyUser.shared.user.methodsOfPayment! {
                if value.nameOfMethod == nameTextField.text! {
                    count += 1
                    let alertVC = UIAlertController(title: "Error", message: "This name already exists, please enter another name!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok!", style: .cancel, handler: nil)
                    alertVC.addAction(okAction)
                    present(alertVC, animated: true)
                }
            }
            if count < 1 {
                let newMethod = PaymentMethod(nameOfImage: "cash", nameOfMethod: "\(nameTextField.text!)", payments: [])
                OneAndOnlyUser.shared.user.methodsOfPayment?.append(newMethod)
                let vc = ViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
