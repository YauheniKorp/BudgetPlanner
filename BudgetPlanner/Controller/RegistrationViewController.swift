//
//  RegistrationViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 16.12.2021.
//

import UIKit
import RealmSwift


class RegistrationViewController: UIViewController {

    private var fullNameTextField = TextFieldView()
    private var surnameTextField = TextFieldView()
    private var emailOrPhoneTextField = TextFieldView()
    private var passwordTextField = TextFieldView()
    private var confirmPasswordTextField = TextFieldView()
    private var signUpLabel = UILabel()
    private var checkLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    private var bottomButton = UIButton()
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Sign Up!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let attributString = NSMutableAttributedString(string: "Sign ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0)])
        attributString.append(NSAttributedString(string: "Up", attributes: [.foregroundColor : UIColor(named: "GreenColor")!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0)]))
        
        signUpLabel.attributedText = attributString
        
        let attStringForBottomButton = NSMutableAttributedString(string: "Have an account? ", attributes: [.foregroundColor : UIColor(named: "GrayColor") as Any])
        attStringForBottomButton.append(NSAttributedString(string: "Log In", attributes: [.foregroundColor : UIColor(named: "GreenColor") as Any]))
        
        bottomButton.setAttributedTitle(attStringForBottomButton, for: .normal)
        
        self.view.backgroundColor = .white
        let arrayOfViews = [emailOrPhoneTextField,passwordTextField,confirmPasswordTextField,fullNameTextField,bottomButton,signUpButton, signUpLabel, checkLabel, surnameTextField]
        
        arrayOfViews.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        arrayOfViews.forEach {view.addSubview($0)}
        
        fullNameTextField.imageName = "Profile"
        fullNameTextField.placeHolder = "First name"
        fullNameTextField.inputTextField.autocorrectionType = .no

        
        surnameTextField.imageName = "Profile"
        surnameTextField.placeHolder = "Surname"
        surnameTextField.inputTextField.autocorrectionType = .no
        
        emailOrPhoneTextField.imageName = "email"
        emailOrPhoneTextField.placeHolder = "Email"
        emailOrPhoneTextField.inputTextField.autocorrectionType = .no
        emailOrPhoneTextField.inputTextField.keyboardType = .emailAddress
        
        passwordTextField.imageName = "Lock"
        passwordTextField.placeHolder = "Password"
        passwordTextField.inputTextField.autocorrectionType = .no
        passwordTextField.inputTextField.isSecureTextEntry = true
        
        
        confirmPasswordTextField.imageName = "Lock"
        confirmPasswordTextField.placeHolder = "Confirm password"
        confirmPasswordTextField.inputTextField.autocorrectionType = .no
        confirmPasswordTextField.inputTextField.isSecureTextEntry = true
        
        
        
        createConstraint()
        bottomButton.addTarget(self, action: #selector(goToLogInVC), for: .touchUpInside)
        
        signUpButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        
    }
    
    @objc
    func goToLogInVC() {
        let nextVC = LogInViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    func registerUser() {
        let vc = ViewController()

        self.navigationController?.pushViewController(vc, animated: true)
//        if fullNameTextField.inputTextField.text != "" && surnameTextField.inputTextField.text != "" && emailOrPhoneTextField.inputTextField.text != "" && confirmPasswordTextField.inputTextField.text != "" && passwordTextField.inputTextField.text != "" && passwordTextField.inputTextField.text == confirmPasswordTextField.inputTextField.text {
//
//            let newUser = User(name: fullNameTextField.inputTextField.text ?? "", surname: surnameTextField.inputTextField.text ?? "", password: passwordTextField.inputTextField.text ?? "", email: emailOrPhoneTextField.inputTextField.text ?? "")
//            
//            Users.shared.users.append(newUser)
//            try! RealmModel.shared.realm.write {
//                var us = RealmModel.shared.realm.create(User.self)
//                us = newUser
//                print(us)
//            }
//            self.checkLabel.text = "Registration was successful!"
//        }
    }
}

extension RegistrationViewController {
    func createConstraint() {
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            fullNameTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 10),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            emailOrPhoneTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10),
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            checkLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
            checkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
