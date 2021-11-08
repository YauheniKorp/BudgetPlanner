//
//  ProfilePhotoView.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import UIKit

class ProfilePhotoView: UIView {

    var nameOfPhotoOfPerson: String?
    private var imageView = UIImageView()
    
    private func setView() {
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.layer.cornerRadius = 20
        //imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.image = UIImage(named: nameOfPhotoOfPerson ?? "")
    }

    init(nameOfPhotoOfPerson: String = "myPhoto") {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.nameOfPhotoOfPerson = nameOfPhotoOfPerson
        setView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
