//
//  DataFeatcher.swift
//  FoodDelivery
//
//  Created by apple on 05/03/25.
//

import Foundation

class Api {
    static let shared = Api()
    private init() {}
      
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "Chicken", price: 12.5, img: "chicken"),
            MenuItem(name: "Pizza", price: 12.5, img: "pizza"),
            MenuItem(name: "Drumplings", price: 12.5, img: "drumplings"),
            MenuItem(name: "Steak", price: 12.5, img: "steak"),
            MenuItem(name: "Sushi", price: 12.5, img: "sushi"),
            MenuItem(name: "Rasgulla", price: 12.5, img: "rasgulla"),
            
        ]
    }
}
