//
//  Home.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct Home: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            VStack(spacing:15){
                HStack(spacing:15){
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    TextField("", text: $searchText)
                   
                }
                .padding()
                .background(
                Capsule()
                    .stroke(.black.opacity(0.8), lineWidth: 1)
                )
                .padding(.horizontal)
                
                Text("Order online \nCollect in store")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(ProductType.allCases, id: \.self){
                            type in
                            ProductTypeView(type: type)
                        }
                    }
                }
                .padding()
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Home {
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button{
            
        }label: {
            Text(type.rawValue)
                .font(.system(size: 15))
                .bold()
        }
    }
}
