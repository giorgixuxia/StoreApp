//
//  ProductDetailView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack {
            Text(product.name)
            Text("Price: $\(product.price)")

            Button("Add to Cart") {
                cartManager.addToCart(product: product)
            }
            .padding()

            NavigationLink(destination: CategoriesView(cartManager: cartManager, products: [])) {
                Text("Back to Categories")
            }
            .padding()
        }
    }
}
