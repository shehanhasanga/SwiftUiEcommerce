//
//  MoreViewProductsView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct MoreViewProductsView: View {
    var body: some View {
        VStack{
            Text("View More")
                .font(.system(size: 24))
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity, alignment: .topLeading)
        .background(Color.gray.opacity(0.1) .ignoresSafeArea())
       
    }
}

struct MoreViewProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreViewProductsView()
    }
}
