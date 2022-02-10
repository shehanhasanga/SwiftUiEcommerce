//
//  ProfileView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-10.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text("My Profile")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth:.infinity,maxHeight: .infinity, alignment: .leading)
                    
                    VStack(spacing:15){
                        Image("face1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                            .offset(y:-30)
                            .padding(.bottom, -20)
                        Text("Shehan Karunarathna")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(spacing:10){
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(Angle(degrees: 180))
                            Text("Address: No. 73/1, Niwandama, \nGampaha,\nSrilanka.")
                                .font(.system(size: 15))
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .leading)
                    }
                    .padding([.horizontal,.bottom])
                    .background(
                        Color.white.cornerRadius(15)
                    )
                    .padding()
                    .padding(.top, 40)
                    
                    CustomNavLink(title: "Edit Profile") {
                        Text("").navigationTitle("Edit Profile")
                            .frame(maxWidth:.infinity,maxHeight: .infinity)
                            .background(
                                Color.gray.opacity(0.2)
                                    .ignoresSafeArea()
                            )
                        
                    }
                    CustomNavLink(title: "Shopping Address") {
                        Text("").navigationTitle("shopping Address")
                            .frame(maxWidth:.infinity,maxHeight: .infinity)
                            .background(
                                Color.gray.opacity(0.2)
                                    .ignoresSafeArea()
                            )
                        
                    }
                    CustomNavLink(title: "Order History") {
                        Text("").navigationTitle("Order History")
                            .frame(maxWidth:.infinity,maxHeight: .infinity)
                            .background(
                                Color.gray.opacity(0.2)
                                    .ignoresSafeArea()
                            )
                        
                    }
                    CustomNavLink(title: "Cards") {
                        Text("").navigationTitle("Cards")
                            .frame(maxWidth:.infinity,maxHeight: .infinity)
                            .background(
                                Color.gray.opacity(0.2)
                                    .ignoresSafeArea()
                            )
                        
                    }
                    CustomNavLink(title: "Notifications") {
                        Text("").navigationTitle("Notifications")
                            .frame(maxWidth:.infinity,maxHeight: .infinity)
                            .background(
                                Color.gray.opacity(0.2)
                                    .ignoresSafeArea()
                            )
                        
                    }
                    
                }
            }
            .padding()
            .navigationBarHidden(true)
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
            )
        }
     
    }
    
    @ViewBuilder
    func CustomNavLink<Detail:View>(title:String, @ViewBuilder content: @escaping () -> Detail) -> some View{
        NavigationLink {
            content()
        } label: {
            HStack{
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white.cornerRadius(12)
            )
            .padding()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
