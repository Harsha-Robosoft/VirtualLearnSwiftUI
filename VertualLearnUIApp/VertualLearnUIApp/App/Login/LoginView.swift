//
//  LoginView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct LoginView: View {
    @State var passwordChanged : Bool
//    @Binding var rigisterTapped : Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var userName = ""
    @State private var password01 = ""
    @State private var userNameTap = false
    @State private var password01Tap = false
    
    @State private var userNameCorrect = false
    @State private var passwordCorrect = false
    
    func checkUsername(name: String){
        if name.lowercased() == "harsha"{
            userNameCorrect = true
        }else{
            userNameCorrect = false
        }
    }
    func checkPassword(password: String){
        if password == "1234567890"{
            passwordCorrect = true
        }else{
            passwordCorrect = false
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            if !passwordChanged{
                HStack(alignment: .center, spacing: 0){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                        Spacer()
                }
                .padding(.top, 20)
            }
            VStack(alignment: .leading, spacing: 15){
                Text("Welcome Back!")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Easy to learn anytime and anywhere. Login to your account")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.top,passwordChanged ? 50 : 20)
            
            HStack(alignment: .center,spacing: 20){
                Image("btn_SM_facebook")
                Image("btn_SM_google")
            }
            .padding(.top, 50)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Username")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            userNameTap.toggle()
                        }
                    }
                    
                if userNameTap {
                    HStack(alignment: .center, spacing: 0) {
                        TextField("", text: $userName)
                            .onChange(of: userName) { newValue in
                                if userName.count > 3{
                                    checkUsername(name: userName)
                                }
                            }
                            .padding(.top, 10)
                            .padding(.bottom,4)
                        if userName.count > 3{
                            Image(systemName: userNameCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(userNameCorrect ? .green : .red)
                        }
                    }
                }
                Rectangle()
                    .frame(width: 340,height: userNameCorrect ? 2 : 1)
//                    .foregroundColor(userNameTap ? .black : .gray.opacity(0.5))
                    .foregroundColor(userNameCorrect ? .green : .gray)
                    .padding(.top, 5)
            }
            .padding(.top, 40)
            .padding(.horizontal, 10)
            
            VStack(alignment: .leading,spacing: 0){
                Text("Password")
                    .font(.system(size: 16))
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            password01Tap.toggle()
                        }
                    }
                
                if password01Tap {
                    HStack(alignment: .center, spacing: 0) {
                        TextField("", text: $password01)
                            .onChange(of: password01) { newValue in
                                if password01.count > 5 {
                                    checkPassword(password: password01)
                                }
                            }
                            .padding(.top)
                        .padding(.bottom,4)
                        
                        if password01.count > 5{
                            Image(systemName: passwordCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(passwordCorrect ? .green : .red)
                        }
                    }
                }
                Rectangle()
                    .frame(width: 340,height: passwordCorrect ? 2 : 1)
//                    .foregroundColor(password01Tap ? .black : .gray.opacity(0.5))
                    .foregroundColor(passwordCorrect ? .green : .gray)
                    .padding(.top, 5)
            }
            .padding(.top, password01Tap ? 10 : 40)
            .padding(.horizontal, 10)
            
            HStack(alignment: .center,spacing: 0){
                Spacer()
                NavigationLink(destination: ForgotPasswordView(), label: {
                    Text("Forgot password?")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                })
                
            }
            .padding(.top, 30)
            .padding(.trailing, 10)
            
            NavigationLink(destination: HomeView(), label: {
                Text("Login")
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .frame(width: 327,height: 46)
                    .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("ColorOrenge"))
                    )
                    .padding(.top, 40)
            })
            
            HStack(alignment: .center,spacing: 4){
                Text("Don’t have a account?")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
                Text("Rigster")
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("ColorOrenge"))
                    .onTapGesture {
//                        rigisterTapped = true
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding(.top, 40)
            Spacer()
                .navigationBarHidden(true)
        }
        .padding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
//    @State static var registertapped = false
    static var previews: some View {
        LoginView(passwordChanged: false)
    }
}
