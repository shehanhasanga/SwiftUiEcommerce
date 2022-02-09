//
//  Product.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation

enum ProductType: String, CaseIterable {
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

struct Product: Identifiable, Hashable {
    var id:String = UUID().uuidString
    var type:ProductType
    var title:String
    var subTitle:String
    var description:String = ""
    var price:String
    var productImage:String = ""
    var quantity:Int = 1
    
}
