//
//  ProductResponse.swift
//  StoreAPP
//
//  Created by gio khukhia on 12/19/23.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}
