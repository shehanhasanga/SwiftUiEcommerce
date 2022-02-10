//
//  ContentView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_status : Bool = false
    var body: some View {
        Group{
            if log_status {
                MainView()
            } else {
                OnBoardingView()
            }
        }
//        OnBoardingView()
//        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
