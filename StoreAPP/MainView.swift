//
//  MainView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct MainView: View {
    let products: [Product]
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack {
            Text("Balance: $\(cartManager.balance)")
            Text("Cart Items: \(cartManager.cartItems.count)")

            Button("Checkout") {
                cartManager.checkout { success in
                    if success {
                        print("Checkout successful!")
                    } else {
                        print("Insufficient balance. Please add funds.")
                    }
                }
            }
            .padding()

            ProductsGridView(products: products, cartManager: cartManager)
        }
    }
}
