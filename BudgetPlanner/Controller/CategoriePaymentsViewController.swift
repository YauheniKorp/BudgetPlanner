//
//  CategoriePaymentsViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 20.01.2022.
//

import UIKit

class CategoriePaymentsViewController: UIViewController {
    
    var categorie: Categorie?
    
    private let tableView = UITableView()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        let attributString = NSMutableAttributedString(string: "Categorie: \(self.categorie?.name ?? "")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)])
        mainLabel.attributedText = attributString
        
        self.view.addSubview(mainLabel)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoriePaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categorie?.payments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PaymentTableViewCell
        cell.setUp((self.categorie?.payments[indexPath.row])!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPayment = self.categorie!.payments[indexPath.row]
        for payment in self.categorie!.payments {
            if payment == selectedPayment {
                let vc = DetailViewController(payment: payment)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
