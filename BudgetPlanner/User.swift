//
//  User.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import Foundation

struct User {
    var name: String
    var surname: String
    var password: String
    var email: String
    var methodsOfPayment: [PaymentMethod]? = [PaymentMethod(nameOfImage: "cash", nameOfMethod: "My Cash"),
                                             PaymentMethod(nameOfImage: "card", nameOfMethod: "My Card")]
    var profilePhoto: String
    var payments: [Payment]?
}

class OneAndOnlyUser {
    
    static var shared = OneAndOnlyUser()
    
    var user = User(name: "Yauheni", surname: "Korp", password: "", email: "",  profilePhoto: "myPhoto" )
}
