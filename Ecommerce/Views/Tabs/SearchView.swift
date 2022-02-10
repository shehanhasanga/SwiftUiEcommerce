//
//  SearchView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct SearchView: View {
    var animation : Namespace.ID
    @EnvironmentObject var homeViewModel:HomeViewModel
    @FocusState var startTF:Bool 
    var body: some View {
        VStack{
            HStack(spacing:10){
                Button{
                    homeViewModel.searchActivated = false
                }label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                    
                }
                .padding(.leading)
                
                searchbar
                    .matchedGeometryEffect(id: "searchbar", in: animation)
            }
            
            if let products = homeViewModel.searchProducts{
                if products.isEmpty {
                    VStack{
                        Text("Items not found")
                            .font(.system(size: 22))
                            .bold()
                        
                        Text("Please try with more generic terms")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    .padding()
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        VStack {
                            Text("Found \(products.count) results")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundColor(.black)
                                .padding(.vertical)
                            
                            
                            stageredView
                            
                        }
                        
                    }
                    .padding(.horizontal, 10)
                }
               
            } else {
                
            }
            
           
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .background(
            ZStack{
                Color.white
                Color.gray.opacity(0.2)
                  
            }
                .ignoresSafeArea()
           
        )
       
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ){
                startTF = true
            }
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}

extension SearchView {
    var stageredView: some View {
        HStack(spacing:10){
            
            var count = homeViewModel.searchProducts.count / 2
            var count1 = homeViewModel.searchProducts.count == 1 ? 1 : count
            
            VStack{
                LazyVStack(spacing:10){
                    ForEach(homeViewModel.searchProducts.prefix(count1)) {
                        product in
                        ProductView(product: product)
                        
                    }
                }
            }
            .padding(.top, 20)
            VStack{
                LazyVStack(spacing:10){
                    ForEach(homeViewModel.searchProducts.suffix(count)) {
                        product in
                        ProductView(product: product)
                    }
                }
            }
          
        }
    }
    
    
    var searchbar: some View {
        HStack(spacing:15){
            Image(systemName: "magnifyingglass")
                .font(.title)
                .foregroundColor(.gray)
            
            TextField("", text: $homeViewModel.searchTxt)
                .disableAutocorrection(true)
                .focused($startTF)
                .textCase(.lowercase)
            
           
        }
        .padding()
        .background(
        Capsule()
            .stroke(Color("Primary").opacity(0.8), lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    @ViewBuilder
    func ProductView(product: Product) -> some View {
        VStack{
            Image(product.productImage)
                .resizable()
                .scaledToFit()
               
                .offset(y: -50)
                .padding(.bottom , -50)
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
        .padding(.top, 50)
    }
}
