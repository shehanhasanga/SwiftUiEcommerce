//
//  MainView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct MainView: View {
    @State var currentTab :Tab = .Home
    var body: some View {
        VStack{
            TabView(selection: $currentTab) {
                Text("home")
                    .tag(Tab.Home)
                Text("Liked")
                    .tag(Tab.Liked)
                Text("Profile")
                    .tag(Tab.Profile)
                Text("Cart")
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
