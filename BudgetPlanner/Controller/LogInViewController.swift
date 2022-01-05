//
//  LogInViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 16.12.2021.
//

import UIKit
import FirebaseAuth

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
    
    private var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let attStringForBottomButton = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.foregroundColor : UIColor(named: "GrayColor") as Any])
        attStringForBottomButton.append(NSAttributedString(string: "Sign Up", attributes: [.foregroundColor : UIColor(named: "GreenColor") as Any]))
        
        signInButton.setAttributedTitle(attStringForBottomButton, for: .normal)

        self.view.backgroundColor = .white
        let arrayOfViews = [emailOrPhoneTextField, passwordTextField, loginButton, signInButton]
        
        arrayOfViews.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        arrayOfViews.forEach {view.addSubview($0)}
        
        emailOrPhoneTextField.imageName = "email"
        emailOrPhoneTextField.placeHolder = "Email"
        emailOrPhoneTextField.inputTextField.autocorrectionType = .no
        emailOrPhoneTextField.inputTextField.keyboardType = .emailAddress
        emailOrPhoneTextField.inputTextField.autocapitalizationType = .none

        
        passwordTextField.imageName = "Lock"
        passwordTextField.placeHolder = "Password"
        passwordTextField.inputTextField.autocorrectionType = .no
        passwordTextField.inputTextField.isSecureTextEntry = true
        passwordTextField.inputTextField.autocapitalizationType = .none

        
        loginButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(goToRegistrationVC), for: .touchUpInside)
        
        createConstraint()
    }
    
    @objc
    private func logIn() {
        guard let email = emailOrPhoneTextField.inputTextField.text, !email.isEmpty,
              let password = passwordTextField.inputTextField.text, !password.isEmpty else {
                  print("Missing field data")
                  return
              }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { auth, error in
            guard error == nil else {
                print("Something was wrong!")
                return
            }
            
            //guard let users = Users.shared.users else {return}
            for user in Users.shared.users {
                if user.email == email {
                    OneAndOnlyUser.shared.user = user
                    print(user.email)
                }
            }
            let vc = ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc
    private func goToRegistrationVC() {
        let vc = RegistrationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        
    }
}
