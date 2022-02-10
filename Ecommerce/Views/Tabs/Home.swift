//
//  Home.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct Home: View {
    @State var searchText = ""
    @Namespace var animation
    @StateObject var homeViewModel = HomeViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing:15){
                ZStack{
                    if homeViewModel.searchActivated {
                        searchbar
                    } else {
                        searchbar
                            .matchedGeometryEffect(id: "searchbar", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        homeViewModel.searchActivated = true
                    }
                
                }
              
                
                
                Text("Order online \nCollect in store")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal)
                
                
                tabs
                filteredItemsView
                
                Button{
                    homeViewModel.showMoreProducts.toggle()
                }label: {
                    Label{
                        Image(systemName: "arrow.right")
                      
                    }icon: {
                        Text("View More")
                    }
                    .foregroundColor(Color("Primary"))
                    .font(.system(size: 15))
                    .frame(maxWidth:.infinity,alignment: .trailing)
                    .padding()
                   
                }
               
                
                
            }
        }
        .background(
            .gray.opacity(0.2)
        )
        .sheet(isPresented: $homeViewModel.showMoreProducts) {
            MoreViewProductsView()
        }
        .overlay(
            ZStack{
                if homeViewModel.searchActivated {
                    SearchView(animation: animation)
                        .environmentObject(homeViewModel)
                }
            }
        )
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Home {
    
    var searchbar: some View {
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
    }
    
    var filteredItemsView: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:25){
                ForEach(homeViewModel.filteredProducts){
                    product in
                    ProductView(product: product)
                }
            }
        }
        .padding(.leading)
    }
    
    var tabs: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:20){
                ForEach(ProductType.allCases, id: \.self){
                    type in
                    ProductTypeView(type: type)
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func NewProductView(product: Product) -> some View {
        VStack{
            Image(product.productImage)
                .resizable()
                .scaledToFit()
               
                .frame(width: getBounds().width / 2.5)
             
            Text(product.title)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top, 5)
            Text(product.subTitle)
                .font(.system(size: 14))
                .bold()
                .foregroundColor(.gray)
                .padding(.top, 0)
            Text(product.price)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding(.top, 5)
            
        }
        .padding(.horizontal, 10)
        .padding(.bottom)
        .background(
            Color.white
                .cornerRadius(35)
        )
        .padding(.top, 80)
    }
    
    @ViewBuilder
    func ProductView(product: Product) -> some View {
        VStack{
            Image(product.productImage)
                .resizable()
                .scaledToFit()
                .aspectRatio(1,contentMode: .fit)
                .frame(width: getBounds().width / 2.5, height:  getBounds().width / 2.5)
                .offset(y: -80)
                .padding(.bottom , -80)
            Text(product.title)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top, 5)
            Text(product.subTitle)
                .font(.system(size: 14))
                .bold()
                .foregroundColor(.gray)
                .padding(.top, 0)
            Text(product.price)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding(.top, 5)
            
        }
        .padding(.horizontal, 10)
        .padding(.bottom)
        .background(
            Color.white
                .cornerRadius(35)
        )
        .padding(.top, 80)
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button{
            withAnimation {
                homeViewModel.productType = type
            }
        }label: {
            Text(type.rawValue)
                .font(.system(size: 15))
                .bold()
                .foregroundColor(homeViewModel.productType == type ? Color("Primary") : .gray)
                .padding(.bottom, 5)
                .overlay(
                    ZStack{
                        if homeViewModel.productType == type {
                            Rectangle()
                                .fill()
                                .frame( height: 2)
                                .matchedGeometryEffect(id: "animation", in: animation)
                                
                        }
                    }
                    , alignment: .bottomLeading
                )
             
            
        }
    }
}
