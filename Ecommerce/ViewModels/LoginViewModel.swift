//
//  LoginViewModel.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation
import SwiftUI

class LoginViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password: String  = ""
    @Published var reenterPassword :String = ""
    
    @Published var registerUser :Bool = false
    
    @Published var showPassword:Bool = false
    @Published var showReenterPassword :Bool = false
    @AppStorage("log_status") var log_status : Bool = false
    init(){
        
    }
    
    func login(){
        withAnimation {
            log_status = true
        }
    }
    func register(){
        withAnimation {
            log_status = true
        }
    }
    
    func fogotPassword(){
        
    }
}
