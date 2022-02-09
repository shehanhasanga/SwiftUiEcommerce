//
//  LoginView.swift
//  Ecommerce
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    var body: some View {
        VStack{
            Text("Welcome \nBack")
                .font(.system(size: 55))
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth:.infinity, alignment: .leading)
                .frame( height: getBounds().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        LinearGradient(colors: [.yellow,.orange.opacity(0.6),Color("Primary")], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .offset(y:-20)
                        
                        Circle()
                            .stroke(.white.opacity(0.7),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                        Circle()
                            .stroke(.white.opacity(0.7),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding()
                            
                    }
                )
          
            ScrollView(.vertical,showsIndicators: false){
                VStack( spacing:15){
                    Text(viewModel.registerUser ? "Register" : "Login" )
                        .font(.system(size: 22))
                        .bold()
                        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
                    
                    
                    CustomtextField(icon: "envelope", title: "Email", hint: "user@gmail.com", value: $viewModel.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    CustomtextField(icon: "lock", title: "Password", hint: "123456", value: $viewModel.password, showPassword: $viewModel.showPassword)
                        .padding(.top, 10)
                   
                    if viewModel.registerUser {
                        CustomtextField(icon: "lock", title: "Re-Enter Password", hint: "123456", value: $viewModel.reenterPassword, showPassword: $viewModel.showPassword)
                            .padding(.top, 10)
                    }
                    
                    Button{
                        viewModel.fogotPassword()
                    }label: {
                        Text("Forgot Password?")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    
                    
                    Button{
                        if viewModel.registerUser {
                            viewModel.fogotPassword()
                        } else {
                            viewModel.login()
                        }
                       
                    } label: {
                        Text(viewModel.registerUser ?  "Register" : "Login")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth:.infinity, alignment: .center)
                            .background(Color("Primary"))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    Button{
                        withAnimation {
                            viewModel.registerUser.toggle()
                        }
                    }label: {
                        Text(viewModel.registerUser ?  "Back to login" : "Create Account")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Primary"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth:.infinity, alignment: .center)
                    
                    
                    
                }
                .padding(30)
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
            )
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
       
        .background(Color("Primary"))
        .ignoresSafeArea()
        .onChange(of: viewModel.registerUser) { newValue in
            viewModel.email = ""
            viewModel.password = ""
            viewModel.reenterPassword = ""
            viewModel.showPassword = false
            viewModel.showReenterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomtextField(icon:String, title:String, hint:String ,value: Binding<String>, showPassword: Binding<Bool>) -> some View{
        VStack(alignment:.leading, spacing: 12){
            Label{
                Text(title)
                    .font(.system(size: 14))
                    
            } icon: {
                Image(systemName: icon)
                
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.8))
        }
        .overlay(
            Group{
                if title.contains("Password"){
                    Button{
                        showPassword.wrappedValue.toggle()
                    } label: {
                        Text(showPassword.wrappedValue ?  "Hide" : "Show")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundColor(Color("Primary"))
                        
                    }
                    .offset( y: 8)
                }
            }
            .frame(maxWidth:.infinity, alignment: .trailing)
           
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
