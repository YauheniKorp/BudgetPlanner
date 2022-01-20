//
//  SettingsViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 15.11.2021.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    var mainView = UIView()
    var secondView = UIView()
    
    lazy var photoView: UIView = {
        let photoView = UIView()
        let image = UIImageView(image: UIImage(named: OneAndOnlyUser.shared.user.profilePhoto))
        image.frame.size = CGSize(width: 100, height: 100)
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        photoView.addSubview(image)
        
        return photoView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = OneAndOnlyUser.shared.user.name + " " + OneAndOnlyUser.shared.user.surname
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.backgroundColor = .clear
        nameLabel.layer.cornerRadius = 3
        nameLabel.layer.borderWidth = 0.3
        nameLabel.layer.borderColor = UIColor.black.cgColor
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .systemGray6
        self.view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        configureUpperView()
    }
    
    func configureUpperView() {
        
        let upperView = UIView()
        upperView.backgroundColor = .systemGray3
        upperView.clipsToBounds = true
        upperView.layer.cornerRadius = 30
        upperView.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomView = UIView()
        bottomView.backgroundColor = .systemGray6
        bottomView.clipsToBounds = true
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        let addNewMethodOfPayment = UIButton()
        addNewMethodOfPayment.layer.cornerRadius = 5
        addNewMethodOfPayment.setTitle("Add new method", for: .normal)
        addNewMethodOfPayment.backgroundColor = .gray
        addNewMethodOfPayment.addTarget(self, action: #selector(addNewPaymentMethod), for: .touchUpInside)
        addNewMethodOfPayment.translatesAutoresizingMaskIntoConstraints = false
        
        let deleteMethodOfPaymentButton = UIButton()
        deleteMethodOfPaymentButton.layer.cornerRadius = 5
        deleteMethodOfPaymentButton.setTitle("Delete method", for: .normal)
        deleteMethodOfPaymentButton.backgroundColor = .gray
        deleteMethodOfPaymentButton.addTarget(self, action: #selector(deleteMethod), for: .touchUpInside)
        deleteMethodOfPaymentButton.translatesAutoresizingMaskIntoConstraints = false
        
        let statisticButton = UIButton()
        statisticButton.layer.cornerRadius = 5
        statisticButton.setTitle("Statistic", for: .normal)
        statisticButton.backgroundColor = .gray
        statisticButton.addTarget(self, action: #selector(goToStatisticViewController), for: .touchUpInside)
        statisticButton.translatesAutoresizingMaskIntoConstraints = false
        
        let logOutButton = UIButton()
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        logOutButton.backgroundColor = .clear
        logOutButton.setTitleColor(.red, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.addSubview(addNewMethodOfPayment)
        bottomView.addSubview(deleteMethodOfPaymentButton)
        bottomView.addSubview(statisticButton)
        bottomView.addSubview(logOutButton)
        
        mainView.addSubview(upperView)
        mainView.addSubview(bottomView)
        
        let imV = UIImageView()
        imV.translatesAutoresizingMaskIntoConstraints = false
        imV.clipsToBounds = true
        let im = UIImage(named: OneAndOnlyUser.shared.user.profilePhoto)
        imV.image = im
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = OneAndOnlyUser.shared.user.name + " " + OneAndOnlyUser.shared.user.surname
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.backgroundColor = .clear
        upperView.addSubview(imV)
        upperView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: -40),
            upperView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            upperView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -view.frame.height / 1.3)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addNewMethodOfPayment.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 50),
            addNewMethodOfPayment.heightAnchor.constraint(equalToConstant: 45.0),
            addNewMethodOfPayment.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 70),
            addNewMethodOfPayment.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            deleteMethodOfPaymentButton.topAnchor.constraint(equalTo: addNewMethodOfPayment.bottomAnchor, constant: 10.0),
            deleteMethodOfPaymentButton.heightAnchor.constraint(equalToConstant: 45.0),
            deleteMethodOfPaymentButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 70.0),
            deleteMethodOfPaymentButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -70.0)
        ])
        
        NSLayoutConstraint.activate([
            statisticButton.topAnchor.constraint(equalTo: deleteMethodOfPaymentButton.bottomAnchor, constant: 10.0),
            statisticButton.heightAnchor.constraint(equalToConstant: 45.0),
            statisticButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 70.0),
            statisticButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -70.0)
        ])
        
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -100.0),
            logOutButton.heightAnchor.constraint(equalToConstant: 45.0),
            logOutButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 70.0),
            logOutButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -70.0)
        ])
        
        NSLayoutConstraint.activate([
            imV.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            imV.widthAnchor.constraint(equalToConstant: view.frame.height * 0.13),
            imV.heightAnchor.constraint(equalToConstant: view.frame.height * 0.13)
        ])
        
        imV.layer.cornerRadius = view.frame.height * 0.13 / 2
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imV.bottomAnchor, constant: 3),
            nameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -2),
            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.6),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    func addNewPaymentMethod() {
        let vc = NewMethodViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func goToStatisticViewController() {
        let vc = StatisticViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func deleteMethod() {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: view.frame.width - 40, height: view.frame.height * 0.2)
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            let vc = MethodsCollectionViewController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    @objc
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = LogInViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
