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
    dynamic var payments: [Payment]? = []
    
    convenience init(nameOfImage: String, nameOfMethod: String, payments: [Payment]) {
        self.init()
        self.nameOfImage = nameOfImage
        self.nameOfMethod = nameOfMethod
        self.payments = payments
    }
}
