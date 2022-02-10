//
//  HomeViewModel.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    @Published var productType:ProductType = .Wearable
    private var cancelable: Set<AnyCancellable> =  Set<AnyCancellable>()
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "Apple watch", subTitle: "Series 6", price: "$369", productImage: "series6"),
        Product(type: .Wearable, title: "Samsung watch", subTitle: "Series 4 : Black", price: "$180", productImage: "series6"),
        Product(type: .Wearable, title: "Apple watch", subTitle: "Series 5", price: "$250", productImage: "series5"),
        Product(type: .Phones, title: "iphone 13", subTitle: "A15 - Bionic", price: "$699", productImage: "iphone13"),
        Product(type: .Phones, title: "iphone 12", subTitle: "A14 - Bionic", price: "$599", productImage: "iphone12"),
        Product(type: .Phones, title: "iphone SE 2", subTitle: "A13 - Bionic", price: "$399", productImage: "iphonese"),
        Product(type: .Laptops, title: "MacBook Air", subTitle: "M1 - Gold", price: "$999", productImage: "macair"),
        Product(type: .Laptops, title: "MacBook Pro", subTitle: "M1 - Gold", price: "$1299", productImage: "macpro"),
        Product(type: .Tablets, title: "iPad Pro", subTitle: "M1 - Silver", price: "$999", productImage: "ipadpro"),
        Product(type: .Tablets, title: "iPad Air", subTitle: "M1 - Silver", price: "$699", productImage: "ipadair"),
        
        
    
    ]
    
    @Published var filteredProducts:[Product] = []
    @Published var showMoreProducts :Bool = false
    
    init(){
//        filterProductByType()
        addSubscriptions()
    }
    
    func addSubscriptions(){
        $productType
            .sink { type in
                let filtered = self.products.filter { product in
                    return product.type == type
                }
                self.filteredProducts = filtered.compactMap({ product in
                        return product
                })
//                self.filterProductByType()
            }
            .store(in: &cancelable)
        
        $searchTxt
            .sink { txt in
                let filtered = self.products.filter { product in
                    return product.title.lowercased().contains(txt.lowercased())
                }
                self.searchProducts = filtered.compactMap({ product in
                        return product
                })
            }
            .store(in: &cancelable)
    }
    
    func filterProductByType(){
        let filtered = products.filter { product in
            return product.type == self.productType
        }
        self.filteredProducts = filtered.compactMap({ product in
                return product
        })
        
        
    }
    @Published var searchProducts:[Product] = []
    
    @Published var searchTxt:String = ""
    @Published var searchActivated :Bool = false
    
  
}
