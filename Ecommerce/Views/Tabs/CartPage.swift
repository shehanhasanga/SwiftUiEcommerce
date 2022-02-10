//
//  CartPage.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct CartPage: View {
    @EnvironmentObject var sharedDataModel:SharedDataModel
    @State var showDeleteOption : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Basket")
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
                            .opacity(sharedDataModel.cartProducts.isEmpty ? 0 : 1)
                        }
                        
                        if sharedDataModel.cartProducts.isEmpty{
                            Group{
                                Image(systemName: "arrow.up.bin")
                                    .font(.system(size: 100))
                                    .padding()
                                Text("No cart items yet")
                                Text("Hit the like button on each product to save favourite ones.")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray)
                                    .padding()
                                    .multilineTextAlignment(.center)
                            }
                        } else{
                            VStack(spacing:15){
                                ForEach(sharedDataModel.cartProducts){
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
                
                if !sharedDataModel.cartProducts.isEmpty{
                    Group{
                        HStack{
                            Text("Total")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            Text("$399")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(Color("Primary"))
                        }
                        
                        Button{
                            
                        }label: {
                            Text("CheckOut")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth:.infinity)
                                .background(Color("Primary"))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            
                        }
                    }
                }
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
        if let index = sharedDataModel.cartProducts.firstIndex(where: { prodcutnew in
            return prodcutnew.id == product.id
        }) {
            withAnimation {
                sharedDataModel.cartProducts.remove(at: index)
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

struct CartPage_Previews: PreviewProvider {
    static var previews: some View {
        CartPage()
            .environmentObject(HomeViewModel())
            .environmentObject(SharedDataModel())
    }
}
