//
//  LogInViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 16.12.2021.
//

import UIKit

class LogInViewController: UIViewController {

    private var emailOrPhoneTextField = TextFieldView()
    private var passwordTextField = TextFieldView()
    private var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Log In!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let arrayOfViews = [emailOrPhoneTextField, passwordTextField, loginButton]
        
        arrayOfViews.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        arrayOfViews.forEach {view.addSubview($0)}
        
        emailOrPhoneTextField.imageName = "email"
        emailOrPhoneTextField.placeHolder = "Email"
        emailOrPhoneTextField.inputTextField.autocorrectionType = .no
        emailOrPhoneTextField.inputTextField.keyboardType = .emailAddress

        
        passwordTextField.imageName = "Lock"
        passwordTextField.placeHolder = "Password"
        passwordTextField.inputTextField.autocorrectionType = .no
        passwordTextField.inputTextField.isSecureTextEntry = true
        
        createConstraint()
    }
}

extension LogInViewController {
    func createConstraint() {
        NSLayoutConstraint.activate([
            emailOrPhoneTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        
    }
}
