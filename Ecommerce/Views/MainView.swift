//
//  MainView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct MainView: View {
    @State var currentTab :Tab = .Home
    @StateObject var shareViewModel = SharedDataModel()
    @Namespace var animation
    var body: some View {
        VStack{
            TabView(selection: $currentTab) {
                Home(animation:animation)
                    .environmentObject(shareViewModel)
                    .tag(Tab.Home)
                LikedPage()
                    .environmentObject(shareViewModel)
                    .tag(Tab.Liked)
                ProfileView()
                    .tag(Tab.Profile)
                CartPage()
                    .environmentObject(shareViewModel)
                    .tag(Tab.Cart)
            }
            
            HStack(spacing:0){
                ForEach(Tab.allCases , id: \.self){
                    tab in
                    Button {
                        currentTab = tab
                    }label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .background(
                                Circle()
                                    .fill(Color("Primary")).opacity(0.5)
                                    .frame(width: 35, height: 35)
                                    .blur(radius: 15)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth:.infinity)
                            .foregroundColor(currentTab == tab ? Color("Primary") : .secondary)
                        
                    }
                }
            }
            .padding(.bottom, 20)
            
        }
        .overlay(
            ZStack{
                if let product = shareViewModel.detailsProduct, shareViewModel.showDetailsProduct {
                    ProductDetailsView(product: product, animation: animation)
                        .environmentObject(shareViewModel)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    
                }
            }
        )
        
        
    }
    init(){
        UITabBar.appearance().isHidden = true
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


enum Tab: String, CaseIterable {
    case Home = "house.fill"
    case Liked = "heart.fill"
    case Profile = "info.circle.fill"
    case Cart = "cart.fill"
    
}
