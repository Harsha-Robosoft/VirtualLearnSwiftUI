//
//  SuccessView.swift
//  VertualLearnUIApp
//
//  Created by Harsha R Mundaragi  on 05/07/23.
//

import SwiftUI

struct SuccessView: View {
    @State var passwordChanges: Bool
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            Spacer()
            Image(passwordChanges ? "img_PasswordChange_sucess_illustration" : "img_Register_sucess_illustration")
            Text(passwordChanges ? "Password Changed!" : "Success!")
                .font(.title)
                .fontWeight(.medium)
                .fontDesign(.rounded)
                .padding(.top, 50)
            Text(passwordChanges ? "Your password has been successfully changed. You can now Login with your new password" : "Your VirtualLearn account has been successfully created!")
                .font(.body)
                .fontDesign(.rounded)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 15)
            Spacer()
                .navigationBarHidden(true)
            if passwordChanges{
                NavigationLink(destination: LoginView(passwordChanged: true), label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                        .padding(.bottom)
                })
            }else{
                
                NavigationLink(destination: HomeView(), label: {
                    Text("Let's Get Started")
                        .fontWeight(.medium)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("ColorOrenge"))
                        .padding(.bottom)
                })
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(passwordChanges: false)
    }
}
