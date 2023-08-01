//
//  LoginView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct LoginRegisterView: View {
    @State var logRigistertapped = false
    
    var body: some View {
        VStack {
            HStack{
                Image("img_virtuallearn_lockup")
                    .padding(.horizontal)
                    .padding(.vertical)
                Spacer()
            }
            Image("img_landing_illustration")
                .padding(.top, 40)
            VStack(alignment: .leading, spacing: 10){
                Text("Welcome,")
                    .font(.title)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)
                Text("Are you ready to study easily in a virtual way?")
                    .font(.body)
                    .fontDesign(.rounded)
                    .foregroundColor(.gray)
            }
            .padding(.top, 50)
            
            VStack(alignment: .center,spacing: 30){
                NavigationLink(destination: LoginView(passwordChanged: false), label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(.white)
                        .frame(width: 327,height: 46)
                        .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("ColorOrenge"))
                        )
                })
                
                Text("Or")
                    .fontWeight(.light)
                    .fontDesign(.rounded)
                
                NavigationLink(destination: NewAccountView(), label: {
                    Text("Register")
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                        .frame(width: 327,height: 46)
                        .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("ColorOrenge"),lineWidth: 2)
                        )
                })
                
            }
            .padding(.top, 55)
            
            //MARK: - need to complete
            
//            NavigationLink(
//                destination: NewAccountView(),
//                isActive: $logRigistertapped
//            ) {
//                EmptyView()
//            }
            
               
           
            VStack(alignment: .center,spacing: 5){
                Text("By creating new account, you agree to our")
                HStack(alignment: .center, spacing: 5){
                    Text("Terms of Services")
                        .foregroundColor(Color.blue)
                    Text("&")
                    Text("Privacy Policy")
                        .foregroundColor(Color.blue)
                }
            }
            .font(.system(size: 14))
            .fontWeight(.light)
            .fontDesign(.rounded)
            .padding(.top,4)
            Spacer()
                .navigationBarHidden(true)
        }
        .onAppear{
            
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
