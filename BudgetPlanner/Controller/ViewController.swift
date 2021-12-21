//
//  ViewController.swift
//  BudgetPlanner
//
//  Created by Admin on 06.10.2021.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    var menu: SideMenuNavigationController?
    var mainUser = OneAndOnlyUser.shared.user
    
    private lazy var pageControll: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .systemPurple
        pageControl.numberOfPages = mainUser.methodsOfPayment!.count
        return pageControl
    }()
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var profileButton = UIButton()
    
    private var scrollViewOfPage = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menu = SideMenuNavigationController(rootViewController: self)
        self.title = "Wallet"
        let customView = ProfilePhotoView(imageButton: profileButton)
        let navItem1 = UIBarButtonItem(customView: customView)
        
        let leftButton = UIBarButtonItem(title: "Hello, \(mainUser.name) \(mainUser.surname)", image: nil, primaryAction: nil, menu: nil)
        leftButton.isEnabled = false
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = navItem1
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(pageControll)
        self.view.addSubview(scrollViewOfPage)
        self.view.addSubview(addButton)
        
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
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.8),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
        
        scrollViewOfPage.backgroundColor = .clear
        
        guard let methodsOfPayment = mainUser.methodsOfPayment else {return}
        configureScrollView(methodsOfPayment)
        
        addButton.addTarget(self, action: #selector(openCategoriesCollectionVC), for: .touchUpInside)
        
        print(scrollViewOfPage.subviews.count)
        profileButton.addTarget(self, action: #selector(profilePhotoAction), for: .touchUpInside)
    }
    
    @objc
    func profilePhotoAction() {
        
        menu = SideMenuNavigationController(rootViewController: SettingsViewController())
        menu?.menuWidth = self.view.frame.width * 0.8
        menu?.blurEffectStyle = .systemThickMaterialLight
        menu?.presentDuration = 1.0
        menu?.dismissDuration = 1.0
        menu?.presentationStyle = .viewSlideOutMenuIn
        menu?.pushStyle = .subMenu
        present(menu!, animated: true, completion: nil)
        
        //SideMenuManager.default.ri
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.viewDidLayoutSubviews()
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControll.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.width)))
        //print(pageControll.currentPage)
    }
}
