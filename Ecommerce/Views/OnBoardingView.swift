//
//  OnBoardingView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct OnBoardingView: View {
    @State var showLoginView : Bool = false
    var body: some View {
        VStack(alignment:.leading, spacing: 40){
            Spacer()
            Spacer()
            Text("Find Your \nGadjets")
                .font(.custom("Raleway", size: 55))
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Image("onboarding")
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
           
            Button{
                withAnimation {
                    showLoginView = true
                }
            }label: {
                Text("Get Started")
                    .font(.headline)
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background()
                    .clipShape(Capsule())
                    .shadow(color: .blue, radius: 10, x: 0, y: 0)
                    .padding()
                    
            }
            Spacer()
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(Color("Primary"))
        .ignoresSafeArea()
        .overlay(
            Group{
                if showLoginView {
                    LoginView()
                        .transition(.move(edge: .bottom))
                }
            }
        )
        
       
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}

extension View {
    func getBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
