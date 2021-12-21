//
//  Payment.swift
//  BudgetPlanner
//
//  Created by Admin on 01.11.2021.
//

import Foundation
import RealmSwift

class Payment: Object {
    //var categorie: Categorie
    @objc dynamic var sum: Double = 0.0
    @objc dynamic var date: Date = Date()
    @objc dynamic var keyNote: String = ""
    @objc dynamic var categorieOfPayment: Categorie?// = Categorie()
    
    convenience init(sum: Double, date: Date, keyNote: String, categorieOfPayment: Categorie) {
        self.init()
        self.sum = sum
        self.date = date
        self.keyNote = keyNote
        self.categorieOfPayment = categorieOfPayment
    }
}
