//
//  ProductDetailsView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct ProductDetailsView: View {
    var product:Product
    var animation: Namespace.ID
    @EnvironmentObject var sharedDataModel:SharedDataModel
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Button{
                        withAnimation(.easeInOut) {
                            sharedDataModel.showDetailsProduct = false
                        }
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                    }
                }
                .padding()
                
                Image(product.productImage)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "\(product.id)\(sharedDataModel.fromSearchPage ? "search" : "image" )", in: animation)
                    .padding(.horizontal)
                    .offset(y: -12)
                    .frame(maxHeight:.infinity)
                
            }
            .frame(height:getBounds().height/2.7)
            .zIndex(1)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.leading, spacing: 10){
                    Text(product.title)
                        .font(.system(size: 20))
                        .bold()
                    Text(product.subTitle)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    Text("Get Apple TV free for one year")
                        .font(.system(size: 16))
                        .padding(.top)
                    Text("Get special offers when buying together with apple iphone and ipads.")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                    Button{
                        
                    }label: {
                        Label{
                            Image(systemName: "arrow.right")
                        }icon: {
                            Text("Full Desription")
                        }
                        .font(.system(size: 15))
                        .foregroundColor(Color("Primary"))
                        .padding()
                       
                    }
                    
                    HStack{
                        Text("Total")
                            .font(.system(size: 17))
                        Spacer()
                        Text("\(product.price)")
                            .font(.system(size: 17))
                            .bold()
                            .foregroundColor(Color("Primary"))
                    }
                    Button{
                        
                    }label: {
                        Text("Add To Basket")
                            .font(.system(size: 10))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth:.infinity)
                           
                            .background(
                                Capsule()
                                    .fill( Color("Primary"))
                            )
                            .padding(.vertical, 20)
                            .shadow(color: .blue.opacity(0.4), radius: 10, x: 0, y: 0)
                            
                          
                    }
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 20))
                    .ignoresSafeArea()
            )
            .zIndex(0)
        }
        .background(
            ZStack{
                Color.white.ignoresSafeArea()
                Color.gray.opacity(0.2).ignoresSafeArea()
            }
            )
    }
}

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailsView(product: HomeViewModel().products[0])
//            .environmentObject(SharedDataModel())
//    }
//}
