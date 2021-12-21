//
//  ProfilePhotoView.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import UIKit

class ProfilePhotoView: UIView {

    var nameOfPhotoOfPerson: String?
    var imageButton: UIButton?
    private var imageView = UIImageView()
    
    private func setView() {
        //addSubview(imageView)
        addSubview(imageButton!)

        imageButton?.clipsToBounds = true
        imageButton?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageButton?.layer.cornerRadius = frame.width / 2
        imageButton?.setBackgroundImage(UIImage(named: nameOfPhotoOfPerson ?? ""), for: .normal)
        
//        imageView.clipsToBounds = true
//        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        imageView.layer.cornerRadius = 20
//        //imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.black.cgColor
//        imageView.image = UIImage(named: nameOfPhotoOfPerson ?? "")
    }

    init(nameOfPhotoOfPerson: String = "myPhoto", imageButton: UIButton, frame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)) {
        super.init(frame: frame)
        self.imageButton = imageButton
        self.nameOfPhotoOfPerson = nameOfPhotoOfPerson
        setView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
