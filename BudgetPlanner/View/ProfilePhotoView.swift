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
        addSubview(imageButton!)
        
        imageButton?.clipsToBounds = true
        imageButton?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageButton?.layer.cornerRadius = frame.width / 2
        imageButton?.setBackgroundImage(UIImage(named: nameOfPhotoOfPerson ?? ""), for: .normal)
        
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
