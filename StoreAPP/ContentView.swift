//
//  ContentView.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var cartManager = CartManager()
    @State private var products: [Product] = []

    var body: some View {
        TabView {
            MainView(products: products, cartManager: cartManager)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            CategoriesView(cartManager: cartManager, products: products)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Categories")
                }
        }
        .onAppear {
       
            guard let url = URL(string: "https://dummyjson.com/products") else {
                fatalError("Invalid URL")
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }

                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                        
                     
                        DispatchQueue.main.async {
                            self.products = response.products
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
            .resume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
