//
//  LoginViewModel.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import Foundation

class LoginViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password: String  = ""
    @Published var reenterPassword :String = ""
    
    @Published var registerUser :Bool = false
    
    @Published var showPassword:Bool = false
    @Published var showReenterPassword :Bool = false
    
    init(){
        
    }
    
    func login(){
        
    }
    func register(){
        
    }
    
    func fogotPassword(){
        
    }
}
