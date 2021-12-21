//
//  SettingsViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 15.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
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
        nameLabel.text = OneAndOnlyUser.shared.user.name + " " + OneAndOnlyUser.shared.user.surname ?? ""
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.backgroundColor = .clear
        nameLabel.layer.cornerRadius = 3
        nameLabel.layer.borderWidth = 0.3
        nameLabel.layer.borderColor = UIColor.black.cgColor
        return nameLabel
    }()
    
    var butt = UIButton()
    
    
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
        
//        mainView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(mainView)
//        self.view.addSubview(secondView)
//
//
//        secondView.backgroundColor = .clear
//        secondView.translatesAutoresizingMaskIntoConstraints = false
//
//        mainView.backgroundColor = .systemGray4
//        mainView.layer.cornerRadius = 30
//        photoView.frame = CGRect(x: view.center.x - photoView.frame.width / 2, y: 0, width: 0, height: 0)
//
////        photoView.frame.size = CGSize(width: 100, height: 100)
////        photoView.layer.cornerRadius = 50
//
//        //nameLabel.frame.size = CGSize(width: view.frame.width, height: 50)
//
//        let stackView = UIStackView(arrangedSubviews: [photoView, nameLabel])
//
//        stackView.axis = .vertical
//        stackView.spacing = 5
//
//        stackView.alignment = .center
//        stackView.distribution = .equalCentering
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        //self.view.addSubview(stackView)
//
//
//        NSLayoutConstraint.activate([
//            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
//            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//
//            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.8)
//        ])
//        NSLayoutConstraint.activate([
//            secondView.topAnchor.constraint(equalTo: mainView.bottomAnchor),
//            secondView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
//            secondView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
//            secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//        mainView.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 65),
//            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
//            //stackView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
//            stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5)
//            //stackView.heightAnchor.constraint(equalTo: mainView.heightAnchor),
//            //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width * 0.2),
//            //stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height / 1.3)
//        ])
        
        //stackView.alignment = .center

//        view.addSubview(tableView)
//        tableView.tableHeaderView = ProfilePhotoView(imageButton: butt, frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        tableView.tableHeaderView?.frame.size = CGSize(width: 100, height: 100)
//        tableView.tableHeaderView?.center.x = tableView.center.x
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
        //self.view.backgroundColor = .red
        
        
        // Do any additional setup after loading the view.
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

        mainView.addSubview(upperView)
        mainView.addSubview(bottomView)
        
        
        let imV = UIImageView()
        //imV.layer.borderWidth = 0.3
        //imV.layer.borderColor = UIColor.black.cgColor
        imV.translatesAutoresizingMaskIntoConstraints = false
        imV.clipsToBounds = true
        //imV.center.x = view.frame.width * 0.8 / 2
        let im = UIImage(named: OneAndOnlyUser.shared.user.profilePhoto)
        imV.image = im
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = OneAndOnlyUser.shared.user.name + " " + OneAndOnlyUser.shared.user.surname ?? ""
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.backgroundColor = .clear
       // nameLabel.layer.cornerRadius = 3
        //nameLabel.layer.borderWidth = 0.3
       // nameLabel.layer.borderColor = UIColor.black.cgColor
        
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
//            imV.centerYAnchor.constraint(equalTo: upperView.centerYAnchor),
            //imV.topAnchor.constraint(equalTo: mainView.topAnchor, constant: view.frame.width * 0.1),
            imV.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
//            imV.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -view.frame.width * 0.045),
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "First Section"
//        case 1: return "Second Section"
//        case 2: return "Third Section"
//        default: break
//        }
//        return ""
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0: return 2
//        case 1: return 3
//        case 2: return 2
//        default: break
//        }
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel!.text = "\(indexPath.row)"
//        return cell
//    }
//    
//    
//}
