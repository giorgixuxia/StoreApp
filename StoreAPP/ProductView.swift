//
//  ProductView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct ProductsView: View {
    let category: String
    @ObservedObject var cartManager: CartManager
    let products: [Product]

    var body: some View {
        VStack {
            Text("Balance: $\(cartManager.balance)")
            ProductsGridView(products: products.filter { $0.category == category }, cartManager: cartManager)
        }
    }
}
