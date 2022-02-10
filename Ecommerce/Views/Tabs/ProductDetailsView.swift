//
//  ProductDetailsView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct ProductDetailsView: View {
    var product:Product
    @EnvironmentObject var sharedDataModel:SharedDataModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: HomeViewModel().products[0])
            .environmentObject(SharedDataModel())
    }
}
