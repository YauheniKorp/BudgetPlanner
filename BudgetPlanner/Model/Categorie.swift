//
//  Categorie.swift
//  BudgetPlanner
//
//  Created by Admin on 09.10.2021.
//

import Foundation
import RealmSwift

class Categorie: Object {
    
    convenience init(nameOfImage: String, name: String) {
        self.init()
        self.nameOfImage = nameOfImage
        self.name = name
    }
    
    @objc dynamic var nameOfImage: String?
    @objc dynamic var name: String?
    dynamic var payments: [Payment] = []
}

class Categories {
    
    static var shared = Categories()
    
    var categories: [Categorie] = [Categorie(nameOfImage: "car", name: "Car"),
        Categorie(nameOfImage: "gift", name: "Gifts"),
        Categorie(nameOfImage: "food", name: "Food"),
        Categorie(nameOfImage: "coffe", name: "Coffe"),
        Categorie(nameOfImage: "clothes", name: "Clothes"),
        Categorie(nameOfImage: "cosmetic", name: "Cosmetic"),
        Categorie(nameOfImage: "entertainment", name: "Entertainment"),
        Categorie(nameOfImage: "fitness", name: "Fitness"),
        Categorie(nameOfImage: "hotel", name: "Hotel"),
        Categorie(nameOfImage: "house", name: "House"),
        Categorie(nameOfImage: "medical", name: "Medical"),
        Categorie(nameOfImage: "people", name: "People"),
        Categorie(nameOfImage: "phone", name: "Phone"),
        Categorie(nameOfImage: "pill", name: "Pill"),
        Categorie(nameOfImage: "plane", name: "Plane"),
        Categorie(nameOfImage: "saving", name: "Saving"),
        Categorie(nameOfImage: "shopping", name: "Shopping"),
        Categorie(nameOfImage: "taxi", name: "Taxi"),
        Categorie(nameOfImage: "transport", name: "Transport")]
    
}

enum Categ: String {
    case car = "Car"
    case gift = "Gifts"
    case food = "Food"
    case coffe = "Coffe"
    case clothes = "Clothes"
    case cosmetic = "Cosmetic"
    case entertainment = "Entertainment"
    case fitness = "Fitness"
    case hotel = "Hotel"
    case house = "House"
    case medical = "Medical"
    case people = "People"
    case phone = "Phone"
    case pill = "Pill"
    case plane = "Plane"
    case saving = "Saving"
    case shopping = "Shopping"
    case taxi = "Taxi"
    case transport = "Transport"
}
