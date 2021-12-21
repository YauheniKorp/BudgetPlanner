//
//  User.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var email: String = ""
    dynamic var methodsOfPayment: [PaymentMethod]? = [PaymentMethod(nameOfImage: "cash", nameOfMethod: "My Cash"),
                                             PaymentMethod(nameOfImage: "card", nameOfMethod: "My Card")]
    @objc dynamic var profilePhoto: String = "myPhoto"
    dynamic var payments: [Payment] = []
    
    convenience init(name: String, surname: String, password: String, email: String, profilePhoto: String = "myPhoto") {
        self.init()
        self.name = name
        self.surname = surname
        self.password = password
        self.email = email
        self.profilePhoto = profilePhoto
    }

}

class Users {
    static var shared = Users()
    var users = [User]()
}

class OneAndOnlyUser {
    
    static var shared = OneAndOnlyUser()
    
    var user = User(name: "Yauheni", surname: "Korp", password: "", email: "",  profilePhoto: "myPhoto" )
}

