//
//  User.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import Foundation
import RealmSwift

class User: Object {
    //@Persisted(primaryKey: true) var id: ObjectId
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var email: String = ""
    dynamic var methodsOfPayment: [PaymentMethod]? = [PaymentMethod(nameOfImage: "cash", nameOfMethod: "My Cash", payments: []),
                                                      PaymentMethod(nameOfImage: "card", nameOfMethod: "My Card", payments: [])]
    @objc dynamic var profilePhoto: String = "nonPhoto"
    //dynamic var payments: [Payment]? = [Payment(sum: 333.0, date: Date(), keyNote: "123", categorieOfPayment: Categorie(nameOfImage: "pen", name: "123"))]
    
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
    
    var realmUsers: Results<User>?
    var users = [User]()
    
}

class OneAndOnlyUser {
    
    static var shared = OneAndOnlyUser()
    
    var user = User(name: "Yauheni", surname: "Korp", password: "", email: "",  profilePhoto: "myPhoto" )
}

