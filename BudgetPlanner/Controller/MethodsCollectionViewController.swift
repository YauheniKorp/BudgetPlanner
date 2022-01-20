//
//  MethodsCollectionViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 18.01.2022.
//

import UIKit

private let reuseIdentifier1 = "MethodCell"

class MethodsCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let navItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(goToMainVC))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = navItem
        self.title = "Removing Methods of Payment"
        
        // Register cell classes
        self.collectionView!.register(MethodCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier1)

    }

    // MARK: UICollectionViewDataSource

    @objc
    func goToMainVC() {
       let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return OneAndOnlyUser.shared.user.methodsOfPayment!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier1, for: indexPath) as! MethodCollectionViewCell
        
        cell.setCell(OneAndOnlyUser.shared.user.methodsOfPayment![indexPath.row])
        print("ok \(OneAndOnlyUser.shared.user.methodsOfPayment![indexPath.row].nameOfMethod)")
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let item = OneAndOnlyUser.shared.user.methodsOfPayment![indexPath.row]
        if indexPath.row != 0 && indexPath.row != 1 {
            for index in OneAndOnlyUser.shared.user.methodsOfPayment!.indices {
                if OneAndOnlyUser.shared.user.methodsOfPayment![index].nameOfMethod == item.nameOfMethod {
                    let alert = UIAlertController(title: "Removing method of payment", message: "Do you want to delete this method of payment: \(OneAndOnlyUser.shared.user.methodsOfPayment![index].nameOfMethod)", preferredStyle: .actionSheet)
                    let okAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                        OneAndOnlyUser.shared.user.methodsOfPayment!.remove(at: index)
                        collectionView.deleteItems(at: [indexPath])
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    
                    alert.addAction(okAction)
                    alert.addAction(cancelAction)
                    present(alert, animated: true)
                }
            }
            return true
        }
         return false
    }
}
