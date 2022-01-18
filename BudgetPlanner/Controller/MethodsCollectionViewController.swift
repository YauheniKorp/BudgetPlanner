//
//  MethodsCollectionViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 18.01.2022.
//

import UIKit

private let reuseIdentifier1 = "MethodCell"

class MethodsCollectionViewController: UICollectionViewController {

    var source: DispatchSourceTimer? = DispatchSource.makeTimerSource(flags: [], queue: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let navItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(goToMainVC))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = navItem
        
        self.collectionView!.register(MethodCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier1)

        
        source?.schedule(deadline: .now(), repeating: 1)
        source?.setEventHandler {
            self.collectionView.reloadData()
        }
        
        source?.resume()
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(_ animated: Bool) {
        source = nil
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        // Configure the cell
    
        return cell
    }
    
//    @objc
//    func asd() {
//        for indexOfMethod in OneAndOnlyUser.shared.user.methodsOfPayment!.indices {
//            if OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].nameOfMethod == paymentMethod?.nameOfMethod {
//                print("\(OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].nameOfMethod)")
//                OneAndOnlyUser.shared.user.methodsOfPayment!.remove(at: indexOfMethod)
//
//                //let vc = ViewController()
//
//                return
//            }
//        }
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
