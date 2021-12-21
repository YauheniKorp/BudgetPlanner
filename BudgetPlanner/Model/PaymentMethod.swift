//
//  CreditCard.swift
//  BudgetPlanner
//
//  Created by Admin on 07.10.2021.
//

import Foundation
import RealmSwift

class PaymentMethod: Object {
    @objc dynamic var nameOfImage: String = ""
    @objc dynamic var nameOfMethod: String = ""
    
    convenience init(nameOfImage: String, nameOfMethod: String) {
        self.init()
        self.nameOfImage = nameOfImage
        self.nameOfMethod = nameOfMethod
    }
}
