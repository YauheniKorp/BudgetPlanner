//
//  ViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 06.10.2021.
//

import UIKit
import SideMenu


class ViewController: UIViewController {
    //private var CheckArr.shared.array = [Int]()
    var menu: SideMenuNavigationController?
    var mainUser = OneAndOnlyUser.shared.user
    var con = 0.0
        
    private lazy var pageControll: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .systemPurple
        pageControl.numberOfPages = mainUser.methodsOfPayment!.count
        return pageControl
    }()
    
    let tableView = UITableView()
//    let paymentTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "plus1"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var statisticButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "stat2"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //let backView = UIView()
    
    private var profileButton = UIButton()
    
    private var scrollViewOfPage = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.view.addSubview(tableView)
        
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        //self.view.addSubview(backView)
        //backView.frame = CGRect(x: 20, y: view.frame.height * 0.55, width: view.frame.width - 40, height: 200)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.alwaysBounceVertical = false
        //tableView.bounces = false
        scrollViewOfPage.bounces = false

        //tableView.translatesAutoresizingMaskIntoConstraints = false
        //self.backView.addSubview(tableView)

        //tableView.frame = CGRect(x: 20, y: view.frame.height * 0.58, width: view.frame.width - 40, height: 200)
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "cell")
//        paymentTableView.delegate = self
//        paymentTableView.dataSource = self
        //menu = SideMenuNavigationController(rootViewController: self)
        self.title = "Wallet"
        let customView = ProfilePhotoView(imageButton: profileButton)
        
//        let navItem2 = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshView))
        let navItem1 = UIBarButtonItem(customView: customView)
        
        let leftButton = UIBarButtonItem(title: "Hello, \(mainUser.name) \(mainUser.surname)", image: nil, primaryAction: nil, menu: nil)
        leftButton.isEnabled = false
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = navItem1
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(pageControll)
        self.view.addSubview(scrollViewOfPage)
        self.view.addSubview(addButton)
        self.view.addSubview(statisticButton)
        
        scrollViewOfPage.delegate = self
        scrollViewOfPage.translatesAutoresizingMaskIntoConstraints = false
        pageControll.addTarget(self, action: #selector(changeValueOfScrollPage(_:)), for: .valueChanged)
        
        
        NSLayoutConstraint.activate([
            scrollViewOfPage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            //
            //scrollViewOfPage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollViewOfPage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewOfPage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewOfPage.heightAnchor.constraint(equalToConstant: 200),
            scrollViewOfPage.widthAnchor.constraint(equalToConstant: self.view.frame.size.width)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.87),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            statisticButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.87),
            statisticButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 50),
            statisticButton.widthAnchor.constraint(equalToConstant: 50),
            statisticButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: pageControll.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10)
            //paymentTableView.heightAnchor.constraint(equalToConstant: 50)

        ])
        
        
        scrollViewOfPage.backgroundColor = .clear
        
        guard let methodsOfPayment = mainUser.methodsOfPayment else {return}
        configureScrollView(methodsOfPayment)
        
        addButton.addTarget(self, action: #selector(openCategoriesCollectionVC), for: .touchUpInside)
        statisticButton.addTarget(self, action: #selector(goToStatisticViewController), for: .touchUpInside)
        
        //print(scrollViewOfPage.subviews.count)
        profileButton.addTarget(self, action: #selector(profilePhotoAction), for: .touchUpInside)
        
        
    }

    @objc
    func goToStatisticViewController() {
       let vc = StatisticViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func refreshView() {
        //self.mainUser = OneAndOnlyUser.shared.user
        //self.view.setNeedsLayout()
        self.tableView.reloadData()
        guard let methodsOfPayment = mainUser.methodsOfPayment else {return}
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveLinear) {
            self.pageControll.numberOfPages = self.mainUser.methodsOfPayment!.count
            self.configureScrollView(methodsOfPayment)
           // self.view.layoutIfNeeded()
        }

        

    }
    
    @objc
    func profilePhotoAction() {
        
        menu = SideMenuNavigationController(rootViewController: SettingsViewController())
        menu?.menuWidth = self.view.frame.width
        menu?.blurEffectStyle = .systemThickMaterialLight
        menu?.presentDuration = 1.0
        menu?.dismissDuration = 1.0
        menu?.presentationStyle = .viewSlideOutMenuIn
        menu?.pushStyle = .subMenu
        present(menu!, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        guard let page = CheckArr.shared.array.last else {return}
        pageControll.currentPage = page
        scrollViewOfPage.setContentOffset(CGPoint(x: CGFloat(page) * self.view.frame.size.width, y: 0), animated: true)
        tableView.reloadData()
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.viewDidLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControll.frame = CGRect(x: 100, y: 420, width: self.view.frame.width - 200, height: 30)
    }
    
//    @objc
//    func asd() {
//        let vc = RegistrationViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    @objc
    func openCategoriesCollectionVC() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 75)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //layout.estimatedItemSize = CGSize(width: 250, height: 250)
        let vc = CategoriesCollectionViewController(collectionViewLayout: layout)
        //vc.navigationController?.navigationBar.prefersLargeTitles = false
        //        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
        //        present(vc, animated: true, completion: nil)
    }
    
    @objc
    func changeValueOfScrollPage(_ sender: UIPageControl) {
        let current = sender.currentPage
        //print(current)
        //self.tableView.reloadData()
        scrollViewOfPage.setContentOffset(CGPoint(x: CGFloat(current) * self.view.frame.size.width, y: 0), animated: true)
    }
    
    //    @objc
    //    func pri() {
    //        self.navigationController?.navigationBar.prefersLargeTitles = true
    //    }
    //
    func configureScrollView(_ cards: [PaymentMethod]) {
        scrollViewOfPage.contentSize = CGSize(width: view.frame.size.width * CGFloat(cards.count), height: scrollViewOfPage.frame.size.height)
        scrollViewOfPage.isPagingEnabled = true
        scrollViewOfPage.showsHorizontalScrollIndicator = false
        for x in 0..<cards.count {
            let page = CardView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: scrollViewOfPage.frame.size.height), card: cards[x])
            
            scrollViewOfPage.addSubview(page)
            
            NSLayoutConstraint.activate([
                page.topAnchor.constraint(equalTo: self.scrollViewOfPage.topAnchor),
                page.leadingAnchor.constraint(equalTo: scrollViewOfPage.leadingAnchor, constant: CGFloat(x) * view.frame.size.width),
                page.widthAnchor.constraint(equalToConstant: view.frame.size.width),
                page.heightAnchor.constraint(equalTo: scrollViewOfPage.heightAnchor)
            ])
        }
    }
}

extension ViewController: UIScrollViewDelegate {

   
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        pageControll.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.width)))
//        print("reload")
//        tableView.reloadData()
//        CheckArr.shared.array.append(pageControll.currentPage)
//        //print(self.cheackArr.count)
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveLinear) {
//            self.pageControll.numberOfPages = self.mainUser.methodsOfPayment!.count
//            self.configureScrollView(methodsOfPayment)
//           // self.view.layoutIfNeeded()
//        }
        
        if scrollView == self.scrollViewOfPage {
//            if scrollView.contentOffset.x > 0.0 {
//                print(con)
                pageControll.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.width)))
                //print(pageControll.currentPage)
                //print("reload")
                CheckArr.shared.array.append(pageControll.currentPage)
                print(CheckArr.shared.array.last!)
                self.tableView.reloadData()
//            } else if scrollView.contentOffset.x == 0.0 && pageControll.currentPage == 1 {
//
//                pageControll.currentPage = 0
//                CheckArr.shared.array.append(pageControll.currentPage)
//                print(CheckArr.shared.array.last!)
//                self.tableView.reloadData()
//
//
//            }
        }
        
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let index = CheckArr.shared.array.last {
            if OneAndOnlyUser.shared.user.methodsOfPayment![index].payments!.count > 0 {
                return OneAndOnlyUser.shared.user.methodsOfPayment![index].payments!.count
            } else {
                return 0
            }
        }
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if let indexOfMethod = CheckArr.shared.array.last {
            let deleteItem = OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments![indexPath.row]
            print(deleteItem)
            for indexOfDeleteItem in OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments!.indices {
                if OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments![indexOfDeleteItem] == deleteItem {
//                    for categorieIndex in Categories.shared.categories.indices {
//                        if Categories.shared.categories[categorieIndex].payments.count > 0 {
//                            print(Categories.shared.categories[categorieIndex].payments.count)
//                            for paymentIndex in Categories.shared.categories[categorieIndex].payments.indices {
//                                print("\(Categories.shared.categories[categorieIndex].payments[paymentIndex])")
//                                if Categories.shared.categories[categorieIndex].payments[paymentIndex] == deleteItem {
//                                    print("deleted \(Categories.shared.categories[categorieIndex].payments[paymentIndex].sum)")
//                                    Categories.shared.categories[categorieIndex].payments.remove(at: paymentIndex)
//                                }
//                            }
//                        }
//
//                    }
                    OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments!.remove(at: indexOfDeleteItem)
                    tableView.deleteRows(at: [indexPath], with: .top)
                    tableView.reloadData()
                    return
                }
            }
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let indexOfMethod = CheckArr.shared.array.last {
            if OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments!.count > 0 {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PaymentTableViewCell {
                        cell.setUp(OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments![indexPath.row])
                        return cell
                    }
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PaymentTableViewCell {
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
       
        if let indexOfMethod = CheckArr.shared.array.last {
            let selectedPayment = OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments![didSelectRowAt.row]
            for payment in OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments! {
                if payment == selectedPayment {
                    let vc = DetailViewController(payment: payment)
                    self.navigationController?.pushViewController(vc, animated: true)
//                    for index in OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments!.indices {
//                        if payment == OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments![index] {
//                            OneAndOnlyUser.shared.user.methodsOfPayment![indexOfMethod].payments!.remove(at: index)
//                            let a = didSelectRowAt
//
//                            tableView.deleteRows(at: [a], with: .top)
//                            tableView.reloadData()
//                        }
//                    }
                }
            }
            
        }
    }
}
