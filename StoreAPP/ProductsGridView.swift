//
//  ProductsGridView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct ProductsGridView: View {
    let products: [Product]
    @ObservedObject var cartManager: CartManager

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
            ForEach(products) { product in
                NavigationLink(destination: ProductDetailView(product: product, cartManager: cartManager)) {
                    VStack {
                        Text(product.name)
                        Text("Price: $\(product.price)")
                        Button("Add to Cart") {
                            cartManager.addToCart(product: product)
                        }
                        .padding()
                    }
                }
            }
        }
        .padding()
    }
}
