//
//  SharedDataModel.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import Foundation
class SharedDataModel:ObservableObject{
    @Published var detailsProduct:Product?
    @Published var showDetailsProduct:Bool = false
    
    @Published var fromSearchPage:Bool = false
}
