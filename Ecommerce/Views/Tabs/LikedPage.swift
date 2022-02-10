//
//  LikedPage.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct LikedPage: View {
//    @EnvironmentObject var homeViewModel:HomeViewModel
    @EnvironmentObject var sharedDataModel:SharedDataModel
    @State var showDeleteOption : Bool = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        Text("Favourites")
                            .font(.system(size: 28))
                            .bold()
                        Spacer()
                        Button{
                            withAnimation {
                                showDeleteOption.toggle()
                            }
                        }label: {
                            Image(systemName: "bin.xmark.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.gray)
                            
                                
                        }
                        .opacity(sharedDataModel.likedProducts.isEmpty ? 0 : 1)
                    }
                    
                    if sharedDataModel.likedProducts.isEmpty{
                        Group{
                            Image(systemName: "arrow.up.bin")
                                .font(.system(size: 100))
                                .padding()
                            Text("No favourites yet")
                            Text("Hit the like button on each product to save favourite ones.")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                                .padding()
                                .multilineTextAlignment(.center)
                        }
                    } else{
                        VStack(spacing:15){
                            ForEach(sharedDataModel.likedProducts){
                                product in
                                HStack(spacing:15){
                                    if showDeleteOption {
                                        Button{
                                            deleteItem(product: product)
                                        }label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                       
                                    }
                                    likeProductCard(product: product)
                                }
                               
                            }
                          
                            
                        }
                        .padding()
                        .padding(.top, 20)
                    }
                   
                }
                .padding()
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(
                ZStack{
                    Color.white
                    Color.gray.opacity(0.4)
                }
            )
        }
    }
    
    func deleteItem(product:Product) {
        if let index = sharedDataModel.likedProducts.firstIndex(where: { prodcutnew in
            return prodcutnew.id == product.id
        }) {
            withAnimation {
                sharedDataModel.likedProducts.remove(at: index)
            }
           
        } else {
            
        }
    }
    
    @ViewBuilder
    func likeProductCard(product:Product) -> some View{
        HStack(spacing:15){
            Image(product.productImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            VStack(alignment:.leading, spacing:10){
                Text(product.title)
                    .font(.system(size: 18))
                    .bold()
                Text(product.subTitle)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                Text("\(product.type.rawValue)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
            }
        }
        .padding()
        .frame(maxWidth:.infinity,alignment: .leading)
        .background(
            Color.white
                .cornerRadius(20)
        )
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
            .environmentObject(HomeViewModel())
            .environmentObject(SharedDataModel())
    }
}
