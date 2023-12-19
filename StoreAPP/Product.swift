//
//  Product.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//


import Foundation

struct Product: Identifiable, Decodable {
    let id: String
    let name: String
    let price: Double
    let category: String
}


import SwiftUI

class CartManager: ObservableObject {
    @Published var cartItems: [Product] = []
    @Published var balance: Double = 100.0

    func addToCart(product: Product) {
        cartItems.append(product)
        updateBalance()
    }

    func updateBalance() {
       
    }

    func checkout(completion: @escaping (Bool) -> Void) {
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let success = self.balance >= 0
            if success {
                self.balance -= self.cartItems.reduce(0) { $0 + $1.price }
                self.cartItems.removeAll()
            }
            completion(success)
        }
    }
}
