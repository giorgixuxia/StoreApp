//
//  CategoriesView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var cartManager: CartManager
    let products: [Product]

    var body: some View {
        List(Array(Set(products.map { $0.category })), id: \.self) { category in
            NavigationLink(destination: ProductsView(category: category, cartManager: cartManager, products: products)) {
                Text(category)
            }
        }
    }
}
